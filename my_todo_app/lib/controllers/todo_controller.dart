import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_todo_app/pages/add_page.dart';

class TodoController {
  static Future<List> fetchTodos() async {
    final uri = Uri.parse('http://api.nstack.in/v1/todos?page=1&limit=10');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      return json['items'] as List;
    } else {
      throw Exception('Add your first todo');
    }
  }

  static Future<void> deleteTodo(String id) async {
    final uri = Uri.parse('http://api.nstack.in/v1/todos/$id');
    final response = await http.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  static Future<void> navigateToEditPage(BuildContext context, Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(todo: item),
    );
    await Navigator.push(context, route);
  }

  static Future<void> navigateToAddPage(BuildContext context) async {
    final route = MaterialPageRoute(builder: (context) => AddTodoPage());
    await Navigator.push(context, route);
  }
}
