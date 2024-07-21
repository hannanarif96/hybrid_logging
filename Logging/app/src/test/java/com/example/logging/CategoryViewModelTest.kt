package com.example.logging

import com.example.logging.category.Category
import com.example.logging.category.CategoryViewModel
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test

class CategoryViewModelTest {
    private lateinit var viewModel: CategoryViewModel

    @BeforeEach
    fun setUp() {
        viewModel = CategoryViewModel()
    }

    @Test
    fun addCategory() {
        val category = Category("Work")
        viewModel.addCategory(category)
        val categories = viewModel.getCategories()
        Assertions.assertTrue(categories.contains(category))
    }

    @Test
    fun getCategories() {
        val category1 = Category("Work")
        val category2 = Category("Personal")
        viewModel.addCategory(category1)
        viewModel.addCategory(category2)
        val categories = viewModel.getCategories()
        Assertions.assertEquals(2, categories.size)
        Assertions.assertTrue(categories.contains(category1))
        Assertions.assertTrue(categories.contains(category2))
    }
}
