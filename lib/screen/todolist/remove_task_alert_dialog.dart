import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

class RemoveTaskAlertDialog extends AlertDialog {
  final Task task;
  final Function(Task task) onRemovePressed;

  RemoveTaskAlertDialog(
      {Key key, @required this.task, @required this.onRemovePressed(Task task)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure you want to delete ${task.name}?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'.toUpperCase()),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Ok'.toUpperCase()),
          onPressed: () {
            onRemovePressed(task);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
