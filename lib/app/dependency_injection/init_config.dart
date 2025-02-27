import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:turbo/app/data/database_helper.dart';
import 'package:turbo/authentication/module/authentication_module.dart';
import 'package:turbo/authentication/state_managament/auth_cubit/cubit/auth_cubit_cubit.dart';
import 'package:turbo/firebase_options.dart';
import 'package:turbo/place/module/get_places_use_case.dart';
import 'package:turbo/place/place_repository/place_repository.dart';
import 'package:turbo/place/place_repository/service/place_service.dart';
import 'package:turbo/place/state_management/place_bloc/cubit/place_cubit.dart';

import '../../authentication/authentication_repository/authentication_repository.dart';
import '../../authentication/authentication_repository/service/authentication_service.dart';
import '../../authentication/module/sign_use_case.dart';
import '../../authentication/state_managament/sign_in_cubit/cubit/sign_in_cubit.dart';
import '../utils/app_preferences.dart';

FutureOr<void> initCore(GetIt sl) async {
  await AppPreferences.init();
  await DatabaseHelper.instance.initDatabase();
  final firebaseInstance = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  final sqliteInstance = DatabaseHelper.instance;

  ///The init order of dependencies is Service/Repository/Use Cases (Module)/State Managament(Cubit or Bloc)
  sl
    ..registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(databaseHelper: sqliteInstance),
    )
    ..registerSingleton<FirebaseFirestore>(
        FirebaseFirestore.instanceFor(app: firebaseInstance))
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(authService: sl<AuthenticationService>()),
    )
    ..registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
          authenticationRepository: sl<AuthenticationRepository>()),
    )
    ..registerLazySingleton<SignInCubit>(
      () => SignInCubit(signInUseCase: sl<SignInUseCase>()),
    )
    ..registerLazySingleton<AuthenticationModule>(
      () => AuthenticationModule(
          authenticationRepository: sl<AuthenticationRepository>()),
    )
    ..registerLazySingleton<AuthCubitCubit>(
      () => AuthCubitCubit(authenticationModule: sl<AuthenticationModule>()),
    )
    ..registerLazySingleton<PlaceService>(
      () => PlaceService(firestore: sl<FirebaseFirestore>()),
    )
    ..registerLazySingleton<PlaceRepository>(
      () => PlaceRepository(placeService: sl<PlaceService>()),
    )
    ..registerLazySingleton<GetPlacesUseCase>(
      () => GetPlacesUseCase(placeRepository: sl<PlaceRepository>()),
    )
    ..registerLazySingleton<PlaceCubit>(
      () => PlaceCubit(getPlacesUseCase: sl<GetPlacesUseCase>()),
    );
}
