// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
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
        options: Options(
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
            'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
            'Access-Control-Allow-Credentials': true
          },
        ),
      );
      if (response.statusCode == 200) {
        final token = response.data.toString();
        return token;
      }
      throw Exception();
    } on DioError {
      throw Exception();
    }
  }
}
