import 'package:auto_route/auto_route.dart';
import 'package:turbo/app/routes/router/app_router.dart';
import 'package:turbo/authentication/state_managament/auth_cubit/cubit/auth_cubit_cubit.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthCubitCubit authCubit;

  AuthGuard(this.authCubit);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final state = authCubit.state;

    state.maybeWhen(
      authenticated: () => resolver.next(), // Permitir la navegación
      orElse: () =>
          router.replace(SignInRoute()), // Redirigir si no autenticado
    );
  }
}
