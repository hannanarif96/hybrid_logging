package com.example.logging.task

import androidx.lifecycle.ViewModel

class TaskViewModel : ViewModel() {
    private val repository = TaskRepository()

    fun addTask(task: Task) {
        repository.addTask(task)
    }

    fun getTasks(): List<Task> {
        return repository.getTasks()
    }
}
