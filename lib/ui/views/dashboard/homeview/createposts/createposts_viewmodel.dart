import 'dart:math';
import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/app/app.router.dart';
import 'package:coin_app/core/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coin_app/ui/views/dashboard/homeview/createposts/createposts_view.form.dart';

class CreatepostViewModel extends FormViewModel {
  final PageController _dashboardController = PageController();
  PageController get dashboardController => _dashboardController;

  final _navigationService = locator<NavigationService>();

  final _apiService = locator<APIService>();
  final log = getLogger("AuthViewModel");

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void onNavBarTap(int value) async {
    _dashboardController.jumpToPage(value);
    _currentIndex = value;
    notifyListeners();
  }

  createPost() async {
    setBusy(true);
    await _apiService.post(
      route: "coin_app:main/tables/Posts/data?columns=id",
      body: {
        "title": posttitleValue,
        "labels": ["integrated"],
        "slug": "elegantly-internal-tools-modular-ford-broadly",
        "text": postdataValue,
        "author": "akeem ashaolu",
        "createdAt": DateTime.now().toIso8601String(),
        "views": Random().nextInt(1000),
      },
    ).then((value) {
      log.v("Data to post here: $value");
      _navigationService.clearStackAndShow(Routes.dashboardView);
      notifyListeners();
    }).onError((error, stackTrace) {
      log.v(error);
      log.v(stackTrace);
    });
    setBusy(false);
  }

  @override
  void setFormStatus() {}
}
