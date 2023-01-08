import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/app/app.router.dart';
import 'package:coin_app/core/models/posts_query_model.dart';
import 'package:coin_app/core/services/api_services.dart';
import 'package:coin_app/ui/views/dashboard/homeview/viewposts/viewposts_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final PageController _dashboardController = PageController();
  PageController get dashboardController => _dashboardController;
  final _navigationService = locator<NavigationService>();

  final _apiService = locator<APIService>();
  final log = getLogger("AuthViewModel");

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Record?>? _postData = [];
  List<Record?>? get postData => _postData;

  void onNavBarTap(int value) async {
    _dashboardController.jumpToPage(value);
    _currentIndex = value;
    notifyListeners();
  }

  void onCardTap(Record? record) async {
    _navigationService.navigateToView(
      ViewpostView(
        postData: record,
      ),
    );
  }

  goToCreatePost() {
    _navigationService.navigateTo(Routes.createpostView);
  }

  Future<void> init() async {
    setBusy(true);
    await _apiService.post(route: "coin_app:main/tables/Posts/query", body: {
      "columns": ["*"]
    }).then((value) async {
      final records = postsQueryModelFromMap(value);
      _postData = records?.records;
      notifyListeners();
      log.v(_postData);
    }).onError((error, stackTrace) {
      log.v(error);
      log.v(stackTrace);
    });
    setBusy(false);
  }
}
