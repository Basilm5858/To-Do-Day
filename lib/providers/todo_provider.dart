import 'package:flutter/foundation.dart';
import 'package:tododay/models/todo_model.dart';
import 'package:tododay/services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  TodoModel? model;
  Future<void> getdata() async {
    model = await TodoService.getData();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    await TodoService.addTask(title: title);

    await getdata();
  }

  Future<void> deleteTask(int id) async {
    await TodoService.deleteTask(id: id);

    await getdata();
  }

  Future<void> updateTask({required int id, required String title}) async {
    await TodoService.updateTask(id: id, title: title);

    await getdata();
  }
}
