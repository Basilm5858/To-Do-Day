import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododay/providers/todo_provider.dart';

class AddTask extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = ' ';
    final providerObject = context.read<TodoProvider>();
    return Container(
      height: 200,
      child: Column(
        children: [
          Text("Add Task", style: TextStyle(color: Colors.teal)),
          TextField(
            onChanged: (value) {
              newTaskTitle = value;
            },
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              if (newTaskTitle.trim() != ' ') {
                providerObject.addTask(newTaskTitle);
              }
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: Colors.teal[400]),
            child: const Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
