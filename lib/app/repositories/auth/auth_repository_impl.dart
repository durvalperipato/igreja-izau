// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:igreja_izau/app/core/log/log.dart';
import 'package:igreja_izau/app/models/user.dart';
import 'package:igreja_izau/app/repositories/auth/auth_repository.dart';

const String LOGIN = "https://ad-porto.herokuapp.com/login";

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<String?> login({required UserModel user}) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        LOGIN,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return response.data["token"];
      }
      throw Exception();
    } on DioError catch (e) {
      Log.error("Erro ao pegar o token do usuário: ${e.message}");
      throw Exception();
    }
  }
}
