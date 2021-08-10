import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db/helpers/theme_helper.dart';
import 'package:todo_db/models/task_model.dart';
import 'package:todo_db/providers/theme_provider.dart';
import 'package:todo_db/providers/todo_provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;

  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer2<TodoProvider, ThemeProvider>(
      builder: (context, provider, provider2, x) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: provider2.themeData == ThemeHelper.darkTheme
                ? Colors.grey
                : taskModel.isComplete
                    ? Colors.green
                    : Colors.redAccent),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
                value: taskModel.isComplete,
                onChanged: (v) {
                  taskModel.isComplete = v;
                  provider.updateTask(taskModel);
                }),
            SizedBox(
              width: 10,
            ),
            Text(
              taskModel.taskName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  provider.deleteTask(taskModel);
                },
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
