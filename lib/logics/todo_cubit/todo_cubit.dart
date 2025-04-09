import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_node/services/todo_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoService todoService = TodoService();
  TodoCubit() : super(TodoInitial());

  Future<void> createTodo({required String title}) async {
    emit(TodoLoading());

    try {
      await todoService.createTodo(title: title);
      emit(TodoLoaded(msg: "Todo created"));
    } catch (e) {
      emit(TodoFailure(msg: e.toString()));
    }
  }
}
