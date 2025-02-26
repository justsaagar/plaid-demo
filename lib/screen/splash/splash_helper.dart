import 'dart:async';

import 'package:plaid_demo/app/routes/route_helper.dart';
import 'package:plaid_demo/screen/splash/splash_screen.dart';

class SplashScreenHelper {
  SplashScreenState state;

  SplashScreenHelper(this.state) {
    manageUser();
  }

  Future<void> manageUser() async {
    Future.delayed(const Duration(seconds: 2), () => RouteHelper.instance.goToOnBoarding());
  }
}
