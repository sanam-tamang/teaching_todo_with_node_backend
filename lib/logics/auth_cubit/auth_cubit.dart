import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_node/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();
  AuthCubit() : super(AuthInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final msg = await _authService.signUp(
        name: name,
        email: email,
        password: password,
      );
      emit(AuthLoaded(msg: msg));
      
    } catch (e) {
      emit(AuthFailure(msg: e.toString()));
    }
  }
}
