part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoLoaded extends TodoState {
  final String msg;

  const TodoLoaded({required this.msg});
  @override
  List<Object> get props => [msg];
}

final class TodoFailure extends TodoState {
  final String msg;

  const TodoFailure({required this.msg});
  @override
  List<Object> get props => [msg];
}
