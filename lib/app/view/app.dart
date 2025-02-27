import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo/app/routes/guards/authentication_guards.dart';
import 'package:turbo/authentication/state_managament/auth_cubit/cubit/auth_cubit_cubit.dart';
import 'package:turbo/authentication/state_managament/sign_in_cubit/cubit/sign_in_cubit.dart';
import 'package:turbo/place/state_management/place_bloc/cubit/place_cubit.dart';

import '../../boostrap.dart';
import '../routes/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<SignInCubit>()),
        BlocProvider.value(value: sl<AuthCubitCubit>()..isAuthenticated()),
        BlocProvider.value(value: sl<PlaceCubit>()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig:
          AppRouter(authGuard: AuthGuard(context.read<AuthCubitCubit>()))
              .config(),
    );
  }
}
