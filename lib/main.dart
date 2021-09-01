import 'package:flutter/material.dart';
import 'package:flutter_todoey/models/task_data.dart';
import 'package:flutter_todoey/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
