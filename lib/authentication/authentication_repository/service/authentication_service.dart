import 'package:sqflite/sqflite.dart';
import 'package:turbo/app/data/database_helper.dart';
import 'package:turbo/authentication/authentication_repository/interface/authentication_interface.dart';
import 'package:turbo/authentication/authentication_repository/models/user_model.dart';

import '../../../app/utils/app_preferences.dart';

class AuthenticationService implements AuthenticationInterface {
  final DatabaseHelper databaseHelper;
  final String userTable = 'users';
  final _pref = AppPreferences();
  AuthenticationService({required this.databaseHelper});

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final db = await databaseHelper.database;

    final results = await db.query(
      userTable,
      where: 'email = ? AND passwordHash = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      final token = _generateAuthToken(email);
      _pref.setAuthToken(token);
      final user = User.fromJson(results.first);
      _pref.setUserId(user.id);
      _pref.setUserName(user.name);
      return user;
    }
    return null;
  }

  @override
  bool isAuthenticated() {
    return _pref.isAuthenticated();
  }

  /// Cierra sesión y elimina el token
  @override
  Future<void> logOut() async {
    await _pref.clearAuthToken();
    await _pref.setUserName('');
  }

  @override
  Future<void> signUp({required User user}) async {
    final db = await databaseHelper.database;
    await db.insert(
      userTable,
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> changePassword(
      {required int userId, required String newPassword}) async {
    final db = await databaseHelper.database;
    final hashedPassword = newPassword;

    await db.update(
      userTable,
      {'passwordHash': hashedPassword},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  String _generateAuthToken(String email) {
    // En una aplicación real, este token vendría de un servidor
    return 'token_${email}_${DateTime.now().millisecondsSinceEpoch}';
  }

  String getUsernameFromEmail(String email) {
    if (email.contains('@')) {
      return email.split('@')[0];
    } else {
      throw const FormatException('El email proporcionado no es válido.');
    }
  }
}
