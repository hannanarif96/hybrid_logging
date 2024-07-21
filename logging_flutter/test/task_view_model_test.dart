import 'package:flutter_test/flutter_test.dart';
import 'package:logging_flutter/task/task.dart';
import 'package:logging_flutter/task/task_view_model.dart';

void main() {
  test('Add and Remove Task', () {
    final taskViewModel = TaskViewModel();

    final task1 = Task('Task 1');
    final task2 = Task('Task 2');

    taskViewModel.addTask(task1);
    taskViewModel.addTask(task2);

    expect(taskViewModel.tasks.length, 2);
    expect(taskViewModel.tasks.contains(task1), true);
    expect(taskViewModel.tasks.contains(task2), true);

    taskViewModel.removeTask(task1);
    expect(taskViewModel.tasks.length, 1);
    expect(taskViewModel.tasks.contains(task1), false);
  });
}
