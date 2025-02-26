import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/scheduler.dart';
import 'package:plaid_demo/app/helper/extension_helper.dart';
import 'package:plaid_demo/screen/onboarding/onboarding_screen.dart';
import 'package:plaid_demo/serialized/onboarding_model.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

class OnBoardingScreenHelper {
  OnboardingScreenState state;
  List<OnBoardingModel> onboardingData = [];
  CarouselSliderController carouselController = CarouselSliderController();
  int currentPage = 0;
  Timer? autoSlideTimer;
  LinkTokenConfiguration? configuration;
  StreamSubscription<LinkEvent>? streamEvent;
  StreamSubscription<LinkExit>? streamExit;
  StreamSubscription<LinkSuccess>? streamSuccess;
  LinkSuccess? successObject;
  String? accessToken;

  OnBoardingScreenHelper(this.state) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      streamEvent = PlaidLink.onEvent.listen(_onEvent);
      streamExit = PlaidLink.onExit.listen(_onExit);
      streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
      final String? linkToken = await state.onboardingController?.getLinkToken();
      'Link token --> $linkToken'.infoLogs();
      if (linkToken != null) {
        createLinkTokenConfiguration(linkToken);
      }
    });
  }

  void updateState() => state.onboardingController?.update();

  void manageCurrentPage(int value) {
    currentPage = value;
    updateState();
  }

  void createLinkTokenConfiguration(String responseMap) {
    configuration = LinkTokenConfiguration(token: responseMap);
    PlaidLink.create(configuration: configuration!);
  }

  void _onEvent(LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    "onEvent: $name, metadata: $metadata".logs();
  }

  Future<void> _onSuccess(LinkSuccess event) async {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    "onSuccess: $token, metadata: $metadata".logs();
    successObject = event;
    if (successObject != null) {
      accessToken = await state.onboardingController?.getAccessToken(successObject?.publicToken ?? '');
      'Access token --> $accessToken'.infoLogs();
      /// TODO: Now you can use this access token to retrieve all the data related to bank account you selected.! ///
    }
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    "onExit metadata: $metadata, error: $error".logs();
  }
}
