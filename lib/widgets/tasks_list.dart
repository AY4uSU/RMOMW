import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemCount: TaskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: TaskData.tasks[index].isDone,
              taskTitle: TaskData.tasks[index].name,
              checkboxChange: (newValue) {
                TaskData.updateTask(TaskData.tasks[index]);
              },
              listTileDelete: () {
                TaskData.deleteTask(TaskData.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
