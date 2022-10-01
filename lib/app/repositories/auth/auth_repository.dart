import 'package:igreja_izau/app/models/user.dart';

abstract class AuthRepository {
  Future<String?> login({required UserModel user});
}
