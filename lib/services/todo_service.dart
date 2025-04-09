import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_with_node/config/api.dart';
import 'package:todo_with_node/models/todo.dart';
import 'package:todo_with_node/services/user_local_service.dart';

class TodoService {
  Future<void> createTodo({required String title}) async {
    try {
      final userId = await UserLocalService.getUserId();
      final response = await http.post(
        Uri.parse('$mainUrl/createTodos'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'completed': false,
          'userId': userId!,
        }),
      );

      if (response.statusCode != 200) {
        print(response.body);
        throw "Something went wrong";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Todo>> getTodos() async {
    try {
      final userId = await UserLocalService.getUserId();
      final response = await http.get(
        Uri.parse('$mainUrl/getTodos/$userId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final todos = jsonDecode(response.body);
        final todoList = List.from(todos).map((e) => Todo.fromJson(e)).toList();
        return todoList;
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      rethrow;
    }
  }
}
