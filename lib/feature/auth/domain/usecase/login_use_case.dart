import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entity/login.dart';
import '../repositry/authrepositry.dart';

class LoginUseCase {
  AuthRepositry authRepositry;
  LoginUseCase({required this.authRepositry});
  Future<Either<Failure, Unit>> call(Login login) async {
    return await authRepositry.login(login);
  }
}
