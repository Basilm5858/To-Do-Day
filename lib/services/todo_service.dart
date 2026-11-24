import 'package:dio/dio.dart';
import 'package:tododay/models/todo_model.dart';

class TodoService {
  static Dio dio = Dio();

  static Future<TodoModel> getData() async {
    Response response = await dio.get(
      "https://mytodoapi.runasp.net/api/TodoItems",
    );
    return TodoModel.fromJson(response.data);
  }

  static Future<void> addTask({required String title}) async {
    await dio.post(
      "https://mytodoapi.runasp.net/api/TodoItems/",
      data: {"title": title},
    );
  }

  static Future<void> updateTask({
    required int id,
    required String title,
  }) async {
    await dio.put(
      "https://mytodoapi.runasp.net/api/TodoItems/$id",
      data: {"title": title},
    );
  }

  static Future<void> deleteTask({required int id}) async {
    await dio.delete("https://mytodoapi.runasp.net/api/TodoItems/$id");
  }
}
