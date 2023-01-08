import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/app/app.router.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final PageController _dashboardController = PageController();
  PageController get dashboardController => _dashboardController;

  final _navigationService = locator<NavigationService>();
  final _persistentStorageService = locator<PersistentStorageService>();
  final log = getLogger("SettingsViewModel");

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  String _cointag = "";
  String get cointag => _cointag;

  String _initials = "";
  String get initials => _initials;

  getDetails() {
    setBusy(true);
    _persistentStorageService.getData("usermail");
    _persistentStorageService.getData("firstname");
    _persistentStorageService.getData("lastname");
    _name = _persistentStorageService.getData("firstname") +
        ' ' +
        _persistentStorageService.getData("lastname");
    _email = _persistentStorageService.getData("usermail");
    _cointag = _persistentStorageService.getData("cointag");
    _initials = _persistentStorageService.getData("firstname")[0] +
        _persistentStorageService.getData("lastname")[0];
    log.v(_persistentStorageService.getData("usermail"));
    notifyListeners();
    setBusy(false);
  }

  void logout() async {
    _navigationService.pushNamedAndRemoveUntil(Routes.authView);
  }

  void onNavBarTap(int value) async {
    _dashboardController.jumpToPage(value);
    _currentIndex = value;
    notifyListeners();
  }
}
