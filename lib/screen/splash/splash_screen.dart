import 'package:flutter/material.dart';
import 'package:plaid_demo/app/constant/app_asset.dart';
import 'package:plaid_demo/app/helper/extension_helper.dart';
import 'package:plaid_demo/app/utills/dimension.dart';
import 'package:plaid_demo/app/widgets/app_background.dart';
import 'package:plaid_demo/app/widgets/app_image_assets.dart';
import 'package:plaid_demo/screen/splash/splash_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashScreenHelper? splashScreenHelper;

  @override
  Widget build(BuildContext context) {
    'Current screen --> $runtimeType'.logs();
    splashScreenHelper ??= SplashScreenHelper(this);
    return const Scaffold(
      body: AppBackground(
        child: Center(child: AppImageAsset(image: AppAsset.appBackground, height: Dimens.heightHuge, width: Dimens.heightHuge)),
      ),
    );
  }
}
