import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

class AddTaskAlertDialog extends AlertDialog {
  final TextEditingController _textFieldController = TextEditingController();
  final Function(Task task) onAddPressed;

  AddTaskAlertDialog({Key key, @required this.onAddPressed(Task task)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Write new action todo'),
      content: TextField(
        autofocus: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (String text) {
          _onAddPressed(context);
        },
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: 'Todo action'),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'.toUpperCase()),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Add'.toUpperCase()),
          onPressed: () {
            _onAddPressed(context);
          },
        )
      ],
    );
  }

  void _onAddPressed(BuildContext context) {
    if (_textFieldController.text.length > 0) {
      onAddPressed(Task(name: _textFieldController.text));
      _textFieldController.clear();
    }
    Navigator.of(context).pop();
  }
}
