package com.example.logging.category

import androidx.lifecycle.ViewModel

class CategoryViewModel : ViewModel() {
    private val repository = CategoryRepository()

    fun addCategory(category: Category) {
        repository.addCategory(category)
    }

    fun getCategories(): List<Category> {
        return repository.getCategories()
    }
}
