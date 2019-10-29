import 'package:flutter/material.dart';
import 'package:todo_list/screen/todolist/tasks_list_page.dart';

/// Created by Valentyn Smetanin
/// Left TODO:
/// - Add localization to string resources,
/// - Add Edit Task page,
/// - Implement 'Move to archive' feature,
/// - Implement Archive page.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _initApp();
  }

  MaterialApp _initApp() {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListWidget(),
    );
  }
}
