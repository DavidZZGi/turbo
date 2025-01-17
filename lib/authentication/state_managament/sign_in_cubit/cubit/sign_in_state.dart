part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.success(User user) = _Success;
  const factory SignInState.error({required String error}) = _Error;
  const factory SignInState.loading() = _Loading;
}
