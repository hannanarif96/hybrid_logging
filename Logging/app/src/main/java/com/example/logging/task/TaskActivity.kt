package com.example.logging.task

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.example.logging.R

class TaskActivity : AppCompatActivity() {
    private lateinit var viewModel: TaskViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_task)

        viewModel = ViewModelProvider(this)[TaskViewModel::class.java]

        val taskEditText = findViewById<EditText>(R.id.task)
        val addButton = findViewById<Button>(R.id.add_button)

        addButton.setOnClickListener {
            val taskName = taskEditText.text.toString()
            viewModel.addTask(Task(taskName))
            Toast.makeText(this, "Task Added", Toast.LENGTH_SHORT).show()
        }
    }
}
