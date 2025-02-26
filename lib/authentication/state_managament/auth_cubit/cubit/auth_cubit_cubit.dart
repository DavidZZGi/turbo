import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turbo/app/core/no_params.dart';
import 'package:turbo/authentication/module/authentication_module.dart';

part 'auth_cubit_state.dart';
part 'auth_cubit_cubit.freezed.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthenticationModule authenticationModule;
  AuthCubitCubit({required this.authenticationModule})
      : super(const AuthCubitState.initial());
  bool isAuthenticated() {
    final authenticated = authenticationModule.call(NoParams());
    if (authenticated) {
      emit(const AuthCubitState.authenticated());
    } else {
      emit(const AuthCubitState.unauthenticated());
    }
    return authenticated;
  }
}
