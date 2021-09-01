import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String? taskTitle;
  final bool? isChecked;
  final Function(bool?)? checkboxCallback;
  final Function()? onLongPress;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskTitle.toString(),
        style: TextStyle(
          decoration: isChecked == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
