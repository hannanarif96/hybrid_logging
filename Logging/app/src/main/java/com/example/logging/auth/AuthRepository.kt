package com.example.logging.auth

class AuthRepository {
    private val users = mutableMapOf<String, String>()

    init {
        users["user"] = "pass"
    }

    fun login(username: String, password: String): Boolean {
        return users[username] == password
    }

    fun signup(username: String, password: String): Boolean {
        return if (users.containsKey(username)) {
            false
        } else {
            users[username] = password
            true
        }
    }
}
