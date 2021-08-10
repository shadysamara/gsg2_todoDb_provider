import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db/models/task_model.dart';
import 'package:todo_db/providers/todo_provider.dart';
import 'package:todo_db/ui/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Text(
          'hello',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Expanded(
          child: Selector<TodoProvider, List<TaskModel>>(
            builder: (context, data, x) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return TaskWidget(
                      data[index],
                    );
                  });
            },
            selector: (context, provider) {
              return provider.allTasks;
            },
          ),
        ),
      ],
    );
  }
}
