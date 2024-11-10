import 'package:flutter/material.dart';
import 'package:turbo/app/routes/guards/authentication_guards.dart';

import 'app/routes/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter(authGuard: AuthGuard(true)).config(),
    );
  }
}
