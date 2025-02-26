import 'package:turbo/app/core/no_params.dart';
import 'package:turbo/app/core/use_case.dart';
import 'package:turbo/authentication/authentication_repository/authentication_repository.dart';

class AuthenticationModule implements UseCase<bool, NoParams> {
  AuthenticationRepository authenticationRepository;
  AuthenticationModule({required this.authenticationRepository});
  @override
  bool call(NoParams params) => authenticationRepository.isAuthenticated();
}
