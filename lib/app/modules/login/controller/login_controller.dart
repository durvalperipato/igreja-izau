// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:igreja_izau/app/core/exceptions/auth_exception.dart';

import 'package:igreja_izau/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(
        state.copyWith(status: LoginStatus.loading),
      );
      final user = await _authService.login(email: email, password: password);
      if (user == null) {
        emit(
          state.copyWith(
              status: LoginStatus.failure, message: 'Erro ao retornar usuário'),
        );
      }
    } on AuthException catch (e) {
      emit(
        state.copyWith(
            status: LoginStatus.failure,
            message: e.errorMessage ?? 'Erro ao realizar login'),
      );
    }
  }
}
