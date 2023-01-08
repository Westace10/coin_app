import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  final PageController _dashboardController = PageController();
  PageController get dashboardController => _dashboardController;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void onNavBarTap(int value) async {
    _dashboardController.jumpToPage(value);
    _currentIndex = value;
    notifyListeners();
  }
}
