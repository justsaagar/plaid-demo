import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plaid_demo/repository/authentication/auth_repository.dart';

class OnboardingController extends GetxController {
  AuthRepository authRepository = GetIt.instance<AuthRepository>();

  Future<String?> getLinkToken() async {
    final String? linkToken = await authRepository.getLinkToken();
    return linkToken;
  }

  Future<String?> getAccessToken(String publicToken) async {
    final String? linkToken = await authRepository.getAccessToken(publicToken);
    return linkToken;
  }
}
