import 'package:dartz/dartz.dart';

import '../../../../error/exception.dart';
import '../../../../error/failure.dart';
import '../../../../error/network/network_info.dart';
import '../../domain/entity/login.dart';
import '../../domain/repositry/authrepositry.dart';
import '../datasource/remote_data_source.dart';
import '../model/login_data_model.dart';

class AuthRepositryImp implements AuthRepositry {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSorce authRemoteDataSorce;
  AuthRepositryImp(
      {required this.authRemoteDataSorce, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> login(Login login) async {
    final LoginModel loginModel =
        LoginModel(email: login.email, password: login.password);

    if (await networkInfo.isconnected) {
      try {
        // ignore: unused_local_variable
        final response = await authRemoteDataSorce.login(loginModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
