import 'package:get/get.dart';
import 'package:plaid_demo/screen/onboarding/onboarding_screen.dart';
import 'package:plaid_demo/screen/splash/splash_screen.dart';

class RouteConstant {
  static const String initial = '/';
  static const String onBoarding = '/onBoarding';
}

class GetPageRouteHelper {
  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => const SplashScreen()),
    GetPage(name: RouteConstant.onBoarding, page: () => const OnboardingScreen()),
  ];
}
