package com.example.logging

import com.example.logging.task.Task
import com.example.logging.task.TaskViewModel
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test

class TaskViewModelTest {
    private lateinit var viewModel: TaskViewModel

    @BeforeEach
    fun setUp() {
        viewModel = TaskViewModel()
    }

    @Test
    fun addTask() {
        val task = Task("Test Task")
        viewModel.addTask(task)
        val tasks = viewModel.getTasks()
        Assertions.assertTrue(tasks.contains(task))
    }

    @Test
    fun getTasks() {
        val task1 = Task("Task 1")
        val task2 = Task("Task 2")
        viewModel.addTask(task1)
        viewModel.addTask(task2)
        val tasks = viewModel.getTasks()
        Assertions.assertEquals(2, tasks.size)
        Assertions.assertTrue(tasks.contains(task1))
        Assertions.assertTrue(tasks.contains(task2))
    }
}
