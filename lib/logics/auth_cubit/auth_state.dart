part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final String msg;
  
  const AuthLoaded({required this.msg});
  @override
  List<Object> get props => [msg];
}

final class AuthFailure extends AuthState {
  const AuthFailure({required this.msg});
  final String msg;

  @override
  List<Object> get props => [msg];
}

