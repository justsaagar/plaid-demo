import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:plaid_demo/screen/onboarding/onboarding_screen.dart';
import 'package:plaid_demo/serialized/onboarding_model.dart';

class OnBoardingScreenHelper {
  OnboardingScreenState state;
  List<OnBoardingModel> onboardingData = [];
  CarouselSliderController carouselController = CarouselSliderController();
  int currentPage = 0;
  Timer? autoSlideTimer;

  OnBoardingScreenHelper(this.state);

  void updateState() => state.onboardingController?.update();

  void manageCurrentPage(int value) {
    currentPage = value;
    updateState();
  }
}
