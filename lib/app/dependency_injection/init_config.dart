import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:turbo/app/data/database_helper.dart';

import '../../authentication/authentication_repository/authentication_repository.dart';
import '../../authentication/authentication_repository/service/authentication_service.dart';
import '../../authentication/module/sign_use_case.dart';
import '../../authentication/state_managament/sign_in_cubit/cubit/sign_in_cubit.dart';
import '../utils/app_preferences.dart';

FutureOr<void> initCore(GetIt sl) async {
  await AppPreferences.init();
  await DatabaseHelper.instance.initDatabase();
  final sqliteInstance = DatabaseHelper.instance;
  sl
    ..registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(databaseHelper: sqliteInstance),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(authService: sl<AuthenticationService>()),
    )
    ..registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
          authenticationRepository: sl<AuthenticationRepository>()),
    )
    ..registerLazySingleton<SignInCubit>(
      () => SignInCubit(signInUseCase: sl<SignInUseCase>()),
    );
}
