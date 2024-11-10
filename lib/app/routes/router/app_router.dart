import 'package:auto_route/auto_route.dart';

import 'package:turbo/app/routes/guards/authentication_guards.dart';
import 'package:turbo/authentication/presentation/screens/sign_in_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          initial: true,
          path: '/sign-in',
        ),
      ];
}
