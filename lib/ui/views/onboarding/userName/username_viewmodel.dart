import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/core/models/data_query_model.dart';
import 'package:coin_app/core/services/api_services.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:coin_app/ui/views/onboarding/userName/username_view.form.dart';
import 'package:email_otp/email_otp.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserNameViewModel extends FormViewModel {
  final log = getLogger("UserNameViewModel");
  final _navigationService = locator<NavigationService>();
  final _persistentStorageService = locator<PersistentStorageService>();
  final _apiService = locator<APIService>();
  EmailOTP myauth = EmailOTP();

  bool _usernameAvailable = false;
  bool get usernameAvailable => _usernameAvailable;

  bool _otpReady = false;
  bool get otpReady => _otpReady;

  goBack() {
    _navigationService.back();
  }

  sendOtp(String email) async {
    myauth.setConfig(
        appName: "Email OTP",
        userEmail: email,
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    await myauth.sendOTP();
  }

  onSendOTP() async {
    setBusy(true);
    await _apiService.post(route: "tutorial:main/tables/Users/query", body: {
      "columns": ["*"]
    }).then((value) async {
      final records = dataQueryModelFromJson(value);
      if (!records!.records!
          .any((element) => element!.email == usernameValue)) {
        var res = await sendOtp(usernameValue!);
        log.v(res);
        if (res == null || res) {
          _otpReady = true;
          notifyListeners();
        } else {
          _otpReady = false;
          notifyListeners();
        }
      } else {
        _usernameAvailable = false;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      log.v(error);
      log.v(stackTrace);
    });
    setBusy(false);
  }

  onNextClick() async {
    setBusy(true);
    var res = await myauth.verifyOTP(otp: otpValue);
    if (res) {
      _persistentStorageService.saveUsername('username', usernameValue!);
      _usernameAvailable = true;
      notifyListeners();
    }

    setBusy(false);
  }

  @override
  void setFormStatus() {}
}
