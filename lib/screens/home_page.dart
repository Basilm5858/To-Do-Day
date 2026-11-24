import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododay/providers/todo_provider.dart';
import 'package:tododay/screens/add_task.dart';
import 'package:tododay/screens/update_task.dart';
import 'package:tododay/widgets/task_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerObject = context.read<TodoProvider>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.playlist_add_check),
              Text(
                "To Day Do",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
          Row(
            children: [
              Consumer<TodoProvider>(
                builder: (context, value, child) {
                  final count = value.model?.tododata.length ?? 0;
                  return Text(
                    "${count} Tasks",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  );
                },
              ),
              Consumer(
                builder: (context, value, child) {
                  return IconButton(
                    onPressed: () {
                      providerObject.getdata();
                    },
                    icon: Icon(Icons.refresh),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              child: Card(
                color: Colors.white,
                child: Consumer<TodoProvider>(
                  builder: (context, value, child) {
                    final data = value.model?.tododata;
                    if (data == null) {
                      providerObject.getdata();
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return TaskTile(
                            taskTitle: data[index].title,
                            onEdit: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return UpdateTask(
                                    id: data[index].id,
                                    oldTitle: data[index].title,
                                  );
                                },
                              );
                            },
                            onDelete: () {
                              providerObject.deleteTask(data[index].id);
                            },
                          );
                        },
                        itemCount: data.length,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the modal bottom sheet for adding a new task
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTask();
            },
          );
        },
        backgroundColor: Colors.red[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
