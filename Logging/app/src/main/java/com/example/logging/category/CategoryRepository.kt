package com.example.logging.category

class CategoryRepository {
    private val categories = mutableListOf<Category>()

    fun addCategory(category: Category) {
        categories.add(category)
    }

    fun getCategories(): List<Category> {
        return categories
    }
}
