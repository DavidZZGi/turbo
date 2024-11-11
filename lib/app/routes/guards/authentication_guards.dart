import 'package:auto_route/auto_route.dart';
import 'package:turbo/app/routes/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final bool isAuthenticated;

  AuthGuard(this.isAuthenticated);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      resolver.next(); // Permitir la navegación
    } else {
      router.push(SignUpRoute()); // Redirigir a SignIn si no autenticado
    }
  }
}
