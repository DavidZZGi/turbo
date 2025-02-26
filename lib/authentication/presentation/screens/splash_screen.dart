import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo/app/routes/router/app_router.dart';
import 'package:turbo/authentication/presentation/widgets/widgets.dart';
import 'package:turbo/authentication/state_managament/auth_cubit/cubit/auth_cubit_cubit.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubitCubit>().isAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        state.when(
            initial: () {},
            authenticated: () {
              context.router.replace(const FeedRoute());
            },
            unauthenticated: () {
              context.router.replace(SignInRoute());
            });
      },
      child: Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Center(
              child: LoginHeader(),
            ),
          ],
        ),
      ),
    );
  }
}
