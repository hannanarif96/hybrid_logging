package com.example.logging.auth

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.example.logging.R

class SignupActivity : AppCompatActivity() {
    private lateinit var viewModel: AuthViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_signup)

        viewModel = ViewModelProvider(this)[AuthViewModel::class.java]

        val usernameEditText = findViewById<EditText>(R.id.username)
        val passwordEditText = findViewById<EditText>(R.id.password)
        val signupButton = findViewById<Button>(R.id.signup_button)

        signupButton.setOnClickListener {
            val username = usernameEditText.text.toString()
            val password = passwordEditText.text.toString()
            val success = viewModel.signup(username, password)
            if (success) {
                Toast.makeText(this, "Signup Successful", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this, "Signup Failed", Toast.LENGTH_SHORT).show()
            }
        }
    }
}