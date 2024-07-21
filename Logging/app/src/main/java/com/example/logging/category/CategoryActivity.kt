package com.example.logging.category

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.example.logging.R

class CategoryActivity : AppCompatActivity() {
    private lateinit var viewModel: CategoryViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_category)

        viewModel = ViewModelProvider(this).get(CategoryViewModel::class.java)

        val categoryEditText = findViewById<EditText>(R.id.category)
        val addButton = findViewById<Button>(R.id.add_button)

        addButton.setOnClickListener {
            val categoryName = categoryEditText.text.toString()
            viewModel.addCategory(Category(categoryName))
            Toast.makeText(this, "Category Added", Toast.LENGTH_SHORT).show()
        }
    }
}
