import 'package:flutter/material.dart';

class Task {

  final String name;
  bool done = false;

  Task({@required this.name}) {
    done = false;
  }

}