package com.example.logging.profile

import androidx.lifecycle.ViewModel

class ProfileViewModel : ViewModel() {
    private val repository = ProfileRepository()

    fun updateProfile(user: User) {
        repository.updateProfile(user)
    }

    fun getProfile(): User {
        return repository.getProfile()
    }
}
