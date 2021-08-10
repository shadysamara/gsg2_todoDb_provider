import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db/models/task_model.dart';
import 'package:todo_db/providers/todo_provider.dart';
import 'package:todo_db/ui/widgets/task_widget.dart';

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
            itemCount: provider.inCompleteTasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                provider.inCompleteTasks[index],
              );
            });
      },
    );
  }
}
