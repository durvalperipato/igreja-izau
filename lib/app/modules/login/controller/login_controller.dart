// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
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
      final token = await _authService.login(email: email, password: password);
      if (token == null) {
        emit(
          state.copyWith(
              status: LoginStatus.failure,
              message: 'Erro ao retornar token do usuário'),
        );
      }
    } on Exception {
      emit(
        state.copyWith(
            status: LoginStatus.failure,
            message: 'Erro ao retornar token do usuário'),
      );
    }
  }
}
