import 'package:turbo/authentication/authentication_repository/models/user_model.dart';

abstract class AuthenticationInterface {
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signUp({required User user});
  Future<void> changePassword(
      {required int userId, required String newPassword});
  bool isAuthenticated();
  Future<void> logOut();
}
