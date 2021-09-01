import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/task.dart';

class TaskData with ChangeNotifier, DiagnosticableTreeMixin {
  List<Task> _taskList = [
    Task(name: 'buy property for re-business'),
    Task(name: 'buy motorcycle tesla'),
    Task(name: 'buy pecel rice bakery'),
  ];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  int get count {
    return _taskList.length;
  }

  void createTask(newTaskTitle) {
    _taskList.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTaskIsDone(Task task) {
    task.taskIsDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('task count', _taskList.length));
  }
}
