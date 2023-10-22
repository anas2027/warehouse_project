import 'package:get/get.dart';
import '../../domain/entity/login.dart';
import '../../domain/usecase/login_use_case.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;

  AuthController({required this.loginUseCase});
  Future login(String email, String password) async {
    Login login;
    login = Login(email: email, password: password);
    await loginUseCase(login);
  }
}
