part of 'login_controller.dart';

enum LoginStatus {
  initial,
  loading,
  failure;
}

class LoginState {
  final String? message;
  final LoginStatus status;
  final String? token;

  LoginState._({required this.status, this.message, this.token});

  factory LoginState.initial() {
    return LoginState._(status: LoginStatus.initial, message: null, token: null);
  }

  LoginState copyWith({LoginStatus? status, String? message, String? token}) {
    return LoginState._(
        status: status ?? this.status,
        message: message ?? this.message,
        token: token ?? this.token);
  }
}
