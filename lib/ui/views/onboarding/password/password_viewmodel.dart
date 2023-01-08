import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/core/services/api_services.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:coin_app/core/utils/validation_manager.dart';
import 'package:coin_app/ui/views/onboarding/password/password_view.form.dart';
import 'package:email_otp/email_otp.dart';
import 'package:stacked/stacked.dart';

class PasswordViewModel extends FormViewModel {
  final log = getLogger("PasswordViewModel");
  final _persistentStorageService = locator<PersistentStorageService>();
  final _apiService = locator<APIService>();

  bool _isCreated = false;
  bool get isCreated => _isCreated;

  bool get disableCreateButton =>
      !isFormValid ||
      passwordValue == null ||
      passwordValue == "" ||
      confirmPasswordValue == null ||
      confirmPasswordValue == "";

  sendOtp(String email) async {
    EmailOTP myauth = EmailOTP();
    myauth.setConfig(
        appEmail: "Coin App",
        appName: "Email OTP",
        userEmail: email,
        otpLength: 6,
        otpType: OTPType.digitsOnly);

    // final session = EmailAuth(sessionName: "Test seesss");
    var res = await myauth.sendOTP();

    log.v(res);
  }

  createAccount() async {
    setBusy(true);
    await _apiService.post(
      route: "tutorial:main/tables/Users/data?columns=id",
      body: {
        "email": _persistentStorageService.getData('username'),
        "bio": "",
        "address": {"street": "", "city": "empty", "zipcode": 000000},
        "team": "",
        "lastname": "",
        "firstname": "",
        "cointag": {"id": "", "password": passwordValue},
      },
    ).then((value) async {
      log.v(value.toString().split(",")[0].split(":")[1]);
      _persistentStorageService.saveUsername('password', passwordValue!);
      _persistentStorageService.saveUsername(
          'accountid', value.toString().split(",")[0].split(":")[1]);
      _isCreated = true;
      notifyListeners();
      log.v(value);
      log.v(_persistentStorageService.getData('accountid'));
    }).onError((error, stackTrace) {
      log.v(error);
      log.v(stackTrace);
    });
    setBusy(false);
  }

  @override
  void setFormStatus() {
    setPasswordValidationMessage(passwordValidator(value: passwordValue ?? ""));
    setConfirmPasswordValidationMessage(confirmPasswordValidator(
        value: confirmPasswordValue ?? "",
        newPasswordValue: passwordValue ?? ""));
  }
}
