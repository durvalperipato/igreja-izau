import 'package:dio/dio.dart';
import 'package:igreja_izau/app/repositories/auth/auth_repository.dart';

const String tokenPath = "https://ad-porto.herokuapp.com/tokenUser";

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      final dio = Dio();

      final response = await dio.post(
        tokenPath,
        options: Options(
          contentType: "application/json",
        ),
        data: {
          "emailUser": email,
          "passwordUser": password,
        },
      );
      if (response.statusCode == 200) {
        final token = response.data.toString();
        return token;
      }
      throw Exception('Erro ao realizar o login');
    } on Exception {
      throw Exception('Erro ao realizar o login');
    }
  }
}
