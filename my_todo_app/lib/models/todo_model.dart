class Todo {
  final String id;
  final String title;
  final String description;

  Todo({required this.id, required this.title, required this.description});

  factory Todo.fromMap(Map data) {
    return Todo(
      id: data['_id'],
      title: data['title'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {"title": title, "description": description, "is_completed": false};
  }
}
