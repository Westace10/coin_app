import 'package:coin_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnBoardingViewModel extends BaseViewModel {
  final PageController _onBoardingController = PageController();
  PageController get onBoardingController => _onBoardingController;

  nextPage() {
    _onBoardingController.nextPage(
        duration: shortDuration, curve: Curves.bounceIn);
  }

  prevPage() {
    _onBoardingController.previousPage(
        duration: shortDuration, curve: Curves.bounceOut);
  }
}
