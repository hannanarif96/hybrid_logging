package com.example.logging

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider

open class MainViewModel (
    private val logger: Logger
): ViewModel() {

    val logsList = mutableListOf<String>()

    fun logData(className: String) {
        logsList.add(logger.logDebug(className))
        logsList.add(logger.logInfo(className))
        logsList.add(logger.logWarn(className))
        logsList.add(logger.logError(className))
    }
}

class MainViewModelFactory(val logger: Logger) : ViewModelProvider.Factory {
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(MainViewModel::class.java)) {
            @Suppress("UNCHECKED_CAST")
            return MainViewModel(logger) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}