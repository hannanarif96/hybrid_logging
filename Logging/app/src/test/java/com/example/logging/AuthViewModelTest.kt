package com.example.logging

import com.example.logging.auth.AuthViewModel
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test

class AuthViewModelTest {
    private lateinit var viewModel: AuthViewModel

    @BeforeEach
    fun setUp() {
        viewModel = AuthViewModel()
    }

    @Test
    fun loginSuccess() {
        val result = viewModel.login("user", "pass")
        Assertions.assertTrue(result)
    }

    @Test
    fun loginFailure() {
        val result = viewModel.login("user", "wrongpass")
        Assertions.assertFalse(result)
    }

    @Test
    fun signupSuccess() {
        val result = viewModel.signup("newuser", "newpass")
        Assertions.assertTrue(result)
    }

    @Test
    fun signupFailure() {
        viewModel.signup("user", "pass") // Existing user
        val result = viewModel.signup("user", "pass")
        Assertions.assertFalse(result)
    }
}

