import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/app/app.router.dart';
import 'package:coin_app/core/models/data_query_model.dart';
import 'package:coin_app/core/services/api_services.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:coin_app/core/utils/validation_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coin_app/ui/views/authentication/auth_view.form.dart';

class AuthViewModel extends FormViewModel {
  final log = getLogger("AuthViewModel");
  final _navigationService = locator<NavigationService>();
  final _persistentStorageService = locator<PersistentStorageService>();
  final _apiService = locator<APIService>();

  bool _isPhone = false;
  bool get isPhone => _isPhone;

  bool get disableCreateButton =>
      !isFormValid ||
      usernameValue == null ||
      usernameValue == "" ||
      passwordValue == null ||
      passwordValue == "";

  switchUsername() {
    _isPhone = !_isPhone;
    notifyListeners();
  }

  onCreateAccount() async {
    setBusy(true);
    _navigationService.navigateTo(Routes.onBoardingView);
    setBusy(false);
  }

  onLogin() async {
    setBusy(true);
    await _apiService.post(route: "tutorial:main/tables/Users/query", body: {
      "columns": ["*"]
    }).then((value) async {
      final records = dataQueryModelFromJson(value);
      if (records!.records!.any((element) => element!.email == usernameValue) &&
          records.records!.any((element) => element!.email == usernameValue)) {
        var firstname = records.records!
            .firstWhere((element) => element!.email == usernameValue)!
            .firstname;
        var lastname = records.records!
            .firstWhere((element) => element!.email == usernameValue)!
            .lastname;
        var cointag = records.records!
            .firstWhere((element) => element!.email == usernameValue)!
            .cointag!["id"];
        var accountid = records.records!
            .firstWhere((element) => element!.email == usernameValue)!
            .id;

        log.v(cointag);
        _persistentStorageService.saveUsername('usermail', usernameValue!);
        _persistentStorageService.saveUsername('firstname', firstname!);
        _persistentStorageService.saveUsername('lastname', lastname!);
        _persistentStorageService.saveUsername('cointag', cointag);
        _persistentStorageService.saveUsername('accountid', accountid!);
        _navigationService.clearStackAndShow(Routes.dashboardView);
        log.v("can login");
      } else {
        log.v("cannot login");
      }
    }).onError((error, stackTrace) {
      log.v(error);
      log.v(stackTrace);
    });
    setBusy(false);
  }

  @override
  void setFormStatus() {
    setPasswordValidationMessage(passwordValidator(value: passwordValue ?? ""));
    setUsernameValidationMessage(
        emailAddressValidator(value: usernameValue ?? ""));
  }
}
