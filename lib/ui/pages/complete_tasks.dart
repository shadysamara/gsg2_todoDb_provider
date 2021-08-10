import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db/models/task_model.dart';
import 'package:todo_db/providers/todo_provider.dart';
import 'package:todo_db/ui/widgets/task_widget.dart';

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, provider, x) {
      return ListView.builder(
          itemCount: provider.completeTasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              provider.completeTasks[index],
            );
          });
    });
  }
}
