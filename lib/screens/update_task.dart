import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododay/providers/todo_provider.dart';

class UpdateTask extends StatelessWidget {
  final int id;
  final String oldTitle;

  const UpdateTask({super.key, required this.id, required this.oldTitle});

  @override
  Widget build(BuildContext context) {
    String newTitle = oldTitle;
    final taskObject = context.read<TodoProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: Column(
          children: [
            Text("Update Task"),
            TextField(
              controller: TextEditingController(text: oldTitle),
              onChanged: (value) {
                newTitle = value;
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (newTitle.trim().isNotEmpty) {
                  taskObject.updateTask(id: id, title: newTitle);
                }

                Navigator.pop(context);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
