import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:igreja_izau/app/core/exceptions/auth_exception.dart';
import 'package:igreja_izau/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      final dio = Dio();
      final response = await dio.postUri(Uri.parse('ENDPOINT DO IZAU'));
      if (response.statusCode == 200) {
        final token = response.data.toString();
        final userCredential = await _firebaseAuth.signInWithCustomToken(token);
        return userCredential.user;
      }
      throw AuthException(errorMessage: 'Erro ao gerar o token');
    } on Exception {
      throw AuthException(errorMessage: 'Erro ao realizar o login');
    }
  }
}
