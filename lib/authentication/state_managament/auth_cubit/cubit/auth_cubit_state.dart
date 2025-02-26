part of 'auth_cubit_cubit.dart';

@freezed
class AuthCubitState with _$AuthCubitState {
  const factory AuthCubitState.initial() = _Initial;
  const factory AuthCubitState.authenticated() = _Authenticated;
  const factory AuthCubitState.unauthenticated() = _Unauthenticated;
}
