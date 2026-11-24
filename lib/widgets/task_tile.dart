import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: Text(taskTitle),
          trailing: Row(
            mainAxisSize: .min,
            children: [
              IconButton(
                onPressed: onEdit,
                icon: Icon(Icons.edit),
                color: Colors.blueAccent,
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
