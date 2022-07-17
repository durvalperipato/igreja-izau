abstract class AuthService {
  Future<String?> login({required String email, required String password});
}
