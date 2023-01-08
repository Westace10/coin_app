import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/app/app.router.dart';
import 'package:coin_app/core/constants/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final log = getLogger("StartupViewModel");

  Future<void> init() async {
    await Future.delayed(veryLongDuration, () {
      _navigationService.replaceWith(Routes.authView);
    });
  }
}
