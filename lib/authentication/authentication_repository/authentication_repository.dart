import 'package:turbo/authentication/authentication_repository/models/user_model.dart';

import 'service/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService authService;
  AuthenticationRepository({required this.authService});

  Future<User?> signIn(
      {required String email, required String password}) async {
    final user = await authService.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<void> signUp({required User user}) async {
    await authService.signUp(user: user);
  }

  Future<void> changePassword(
      {required int userId, required String newPassword}) async {
    await authService.changePassword(userId: userId, newPassword: newPassword);
  }

  bool isAuthenticated() => authService.isAuthenticated();
  Future<void> logOut() async => await authService.logOut();
}
