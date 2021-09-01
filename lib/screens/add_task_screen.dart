import 'package:flutter/material.dart';
import 'package:flutter_todoey/components/rounded_button.dart';
import 'package:flutter_todoey/models/task_data.dart';
import 'package:flutter_todoey/utils/constanta.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final taskMsgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Daily Task',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              TextField(
                autofocus: true,
                style: kTextFieldTextStyle,
                decoration: kInputDecoration.copyWith(
                  hintText: 'ex: maintenance server 403',
                  prefixIcon: Icon(Icons.add_task_rounded),
                  suffixIcon: IconButton(
                    onPressed: taskMsgController.clear,
                    icon: Icon(Icons.clear),
                  ),
                ),
                textInputAction: TextInputAction.done,
                controller: taskMsgController,
                onChanged: (value) {
                  //
                },
                onSubmitted: (value) {
                  context.read<TaskData>().createTask(value);
                  taskMsgController.clear();
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 32.0,
              ),
              RoundedButton(
                title: 'GO',
                colour: Colors.lightBlue,
                onPressed: () {
                  context
                      .read<TaskData>()
                      .createTask(taskMsgController.text.toString());
                  taskMsgController.clear();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
