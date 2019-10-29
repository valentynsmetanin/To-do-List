import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/screen/todolist/add_task_alert_dialog.dart';
import 'package:todo_list/screen/todolist/remove_task_alert_dialog.dart';

class TaskListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskListWidget> {
  final List<Task> _tasks = List<Task>();
  final TextStyle _unDoneTextStyle = TextStyle(fontSize: 18);
  final TextStyle _doneTextStyle =
      TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: ListView(children: _mapTaskToTiles(_tasks)),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add task',
        child: const Icon(Icons.add),
        onPressed: () {
          _onAddTaskPressed(context);
        },
      ),
    );
  }

  List<Widget> _mapTaskToTiles(List<Task> tasks) {
    final Iterable<Widget> tiles = tasks.map((Task task) {
      return _buildRow(task);
    });
    return ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
  }

  Widget _buildRow(Task task) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(8))),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            task.name,
            style: task.done ? _doneTextStyle : _unDoneTextStyle,
          ),
        ),
        leading: Container(
          width: 6,
          decoration: new BoxDecoration(
            color: task.done ? Colors.blueGrey : Colors.lightGreen,
            borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(8),
                bottomLeft: const Radius.circular(8)),
          ),
        ),
        onTap: () {
          _onChangeTaskStatus(task);
        },
        onLongPress: () {
          _onLongTaskPressed(context, task);
        },
      ),
    );
  }

  void _onChangeTaskStatus(Task task) {
    if (task == null) {
      return;
    }

    setState(() {
      task.done = !task.done;
    });
  }

  void _onAddTaskPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AddTaskAlertDialog(onAddPressed: (Task task) {
            _onAddNewTask(task);
          });
        });
  }

  void _onLongTaskPressed(BuildContext context, Task task) {
    showDialog(
        context: context,
        builder: (context) {
          return RemoveTaskAlertDialog(
              task: task,
              onRemovePressed: (Task task) {
                _onRemoveTask(task);
              });
        });
  }

  void _onAddNewTask(Task task) {
    if (task == null) {
      return;
    }
    setState(() {
      _tasks.add(task);
    });
  }

  void _onRemoveTask(Task task) {
    if (task == null) {
      return;
    }
    setState(() {
      _tasks.remove(task);
    });
  }
}
