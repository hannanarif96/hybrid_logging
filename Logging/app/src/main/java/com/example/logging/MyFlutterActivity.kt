package com.example.logging

import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatDelegate
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MyFlutterActivity: FlutterActivity() {

    private val CHANNEL = "com.example.settings"
    private lateinit var sharedPreferences: SharedPreferences


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        sharedPreferences = getSharedPreferences("user_settings", MODE_PRIVATE)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getDarkMode" -> {
                    // Retrieve dark mode preference
                    val darkMode = getDarkModePreference()
                    result.success(darkMode)
                }
                "setDarkMode" -> {
                    // Set dark mode preference
                    val darkMode = call.arguments as Boolean
                    setDarkModePreference(darkMode)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getDarkModePreference(): Boolean {
        return sharedPreferences.getBoolean("dark_mode", isDarkModeEnabled())
    }

    private fun setDarkModePreference(darkMode: Boolean) {
        with(sharedPreferences.edit()) {
            putBoolean("dark_mode", darkMode)
            apply()
        }

        AppCompatDelegate.setDefaultNightMode(
            if (darkMode) AppCompatDelegate.MODE_NIGHT_YES else AppCompatDelegate.MODE_NIGHT_NO
        )
    }

    private fun isDarkModeEnabled(): Boolean {
        val nightModeFlags = resources.configuration.uiMode and android.content.res.Configuration.UI_MODE_NIGHT_MASK
        return nightModeFlags == android.content.res.Configuration.UI_MODE_NIGHT_YES
    }
}