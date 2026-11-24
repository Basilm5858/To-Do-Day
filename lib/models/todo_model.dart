class TodoModel {
  final bool status;
  final String message;
  final List<TodoList> tododata;

  TodoModel({
    required this.status,
    required this.message,
    required this.tododata,
  });
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final tempData = json["todoList"]
        .map<TodoList>(
          (item) => TodoList(
            id: item["id"],
            title: item["title"] ?? "",
            description: item["description"] ?? "",
            isCompleted: item["isCompleted"] ?? false,
            createdAt: item["createdAt"] ?? "",
          ),
        )
        .toList();
    return TodoModel(
      status: json["status"],
      message: json["message"],
      tododata: tempData,
    );
  }
}

class TodoList {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final String createdAt;

  TodoList({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });
}
