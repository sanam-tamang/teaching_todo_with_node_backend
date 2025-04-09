import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_node/models/todo.dart';
import 'package:todo_with_node/services/todo_service.dart';

part 'get_todo_state.dart';

class GetTodoCubit extends Cubit<GetTodoState> {
  final TodoService _todoService = TodoService();
  GetTodoCubit() : super(GetTodoInitial());
  Future<void> getTodos() async {
    emit(GetTodoLoading());

    try {
      final todos = await _todoService.getTodos();
      emit(GetTodoLoaded(todos: todos));
    } catch (e) {
      emit(GetTodoFailure(msg: e.toString()));
    }
  }
}
