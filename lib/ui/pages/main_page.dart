import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db/helpers/db_helper.dart';
import 'package:todo_db/models/task_model.dart';
import 'package:todo_db/providers/todo_provider.dart';
import 'package:todo_db/ui/pages/all_tasks.dart';
import 'package:todo_db/ui/pages/complete_tasks.dart';
import 'package:todo_db/ui/pages/incomplete_tasks.dart';
import 'package:todo_db/ui/pages/new_task_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewTaskPage();
                  }));
                },
                icon: Icon(Icons.add))
          ],
          title: Text('Todo App'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'All Tasks',
            ),
            Tab(
              text: 'Complete Tasks',
            ),
            Tab(
              text: 'InComplete Tasks',
            ),
          ]),
        ),
        body: Provider.of<TodoProvider>(context).allTasks == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(children: [
                AllTasks(),
                CompleteTasks(),
                InCompleteTasks(),
              ]),
      ),
    );
  }
}
