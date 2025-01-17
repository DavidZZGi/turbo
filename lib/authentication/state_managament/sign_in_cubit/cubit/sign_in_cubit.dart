import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turbo/authentication/module/sign_use_case.dart';
import 'package:turbo/authentication/module/use_case_params_models/sign_in_use_case_params.dart';
import '../../../authentication_repository/models/user_model.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;
  SignInCubit({required this.signInUseCase})
      : super(const SignInState.initial());

  Future<void> signIn(String email, String password) async {
    emit(const _Loading());
    try {
      final user = await signInUseCase
          .call(SignInParams(email: email, password: password));
      emit(_Success(user!));
    } catch (error) {
      emit(_Error(error: error.toString()));
    }
  }
}
