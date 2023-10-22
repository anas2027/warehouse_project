import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entity/login.dart';

abstract class AuthRepositry {
  Future<Either<Failure, Unit>> login(Login login);
}
