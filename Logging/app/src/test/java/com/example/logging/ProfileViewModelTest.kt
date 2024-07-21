package com.example.logging

import com.example.logging.profile.ProfileViewModel
import com.example.logging.profile.User
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

class ProfileViewModelTest {
    private lateinit var viewModel: ProfileViewModel

    @BeforeEach
    fun setUp() {
        viewModel = ProfileViewModel()
    }

    @Test
    fun updateProfile() {
        val user = User("John Doe", "john.doe@example.com")
        viewModel.updateProfile(user)
        val updatedUser = viewModel.getProfile()
        assertEquals(user, updatedUser)
    }

    @Test
    fun getProfile() {
        val user = User("John Doe", "john.doe@example.com")
        viewModel.updateProfile(user)
        val fetchedUser = viewModel.getProfile()
        assertEquals("John Doe", fetchedUser.name)
        assertEquals("john.doe@example.com", fetchedUser.email)
    }
}
