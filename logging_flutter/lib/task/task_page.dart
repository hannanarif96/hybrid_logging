import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_view_model.dart';
import 'task.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.tasks.length,
            itemBuilder: (context, index) {
              final task = viewModel.tasks[index];
              return ListTile(
                title: Text(task.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    viewModel.removeTask(task);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final viewModel = Provider.of<TaskViewModel>(context, listen: false);
          viewModel.addTask(Task('New Task ${viewModel.tasks.length + 1}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
