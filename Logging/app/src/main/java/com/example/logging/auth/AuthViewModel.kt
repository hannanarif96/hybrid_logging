package com.example.logging.auth

import androidx.lifecycle.ViewModel

class AuthViewModel : ViewModel() {
    private val repository = AuthRepository()

    fun login(username: String, password: String): Boolean {
        return repository.login(username, password)
    }

    fun signup(username: String, password: String): Boolean {
        return repository.signup(username, password)
    }
}
