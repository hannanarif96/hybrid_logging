package com.example.logging.profile

class ProfileRepository {
    private var user = User("Default Name", "default@example.com")

    fun updateProfile(updatedUser: User) {
        user = updatedUser
    }

    fun getProfile(): User {
        return user
    }
}
