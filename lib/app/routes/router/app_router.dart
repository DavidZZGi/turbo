import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:turbo/app/routes/guards/authentication_guards.dart';
import 'package:turbo/authentication/presentation/screens/aut_screens.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignUpRoute.page,
          path: '/sign-up',
        ),
        AutoRoute(
          initial: true,
          page: SignInRoute.page,
          path: '/sign-in',
        ),
      ];
}
