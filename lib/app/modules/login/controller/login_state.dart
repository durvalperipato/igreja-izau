part of 'login_controller.dart';

enum LoginStatus {
  initial,
  loading,
  failure;
}

class LoginState {
  final String? message;
  final LoginStatus status;

  LoginState._({required this.status, this.message});

  factory LoginState.initial() {
    return LoginState._(status: LoginStatus.initial, message: null);
  }

  LoginState copyWith({LoginStatus? status, String? message}) {
    return LoginState._(
        status: status ?? this.status, message: message ?? this.message);
  }
}
