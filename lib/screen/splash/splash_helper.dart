import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:plaid_demo/app/helper/extension_helper.dart';
import 'package:plaid_demo/app/routes/route_helper.dart';
import 'package:plaid_demo/screen/splash/splash_screen.dart';

class SplashScreenHelper {
  SplashScreenState state;

  SplashScreenHelper(this.state) {
    manageUser();
  }

  Future<void> manageUser() async {
    'FirebaseAuth.instance.currentUser --> ${FirebaseAuth.instance.currentUser?.uid}'.infoLogs();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (FirebaseAuth.instance.currentUser?.uid != null) {
        } else {
          RouteHelper.instance.goToOnBoarding();
        }
      },
    );
  }
}
