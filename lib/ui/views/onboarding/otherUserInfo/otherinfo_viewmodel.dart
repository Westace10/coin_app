import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:coin_app/core/utils/validation_manager.dart';
import 'package:coin_app/ui/views/onboarding/otherUserInfo/otherinfo_view.form.dart';
import 'package:email_otp/email_otp.dart';
import 'package:stacked/stacked.dart';

class OtherInfoViewModel extends FormViewModel {
  final log = getLogger("PasswordViewModel");
  final _persistentStorageService = locator<PersistentStorageService>();

  bool _next = false;
  bool get next => _next;

  bool get disableCreateButton =>
      !isFormValid ||
      lastnameValue == null ||
      lastnameValue == "" ||
      firstnameValue == null ||
      firstnameValue == "" ||
      cointagValue == null ||
      cointagValue == "";

  verifyOtp(String email, dynamic otp) async {
    EmailOTP myauth = EmailOTP();
    log.v(otp);
    var res = await myauth.verifyOTP(otp: otp);
    log.v(res);
  }

  nextPage() {
    _persistentStorageService.saveUsername('firstname', firstnameValue!);
    _persistentStorageService.saveUsername('lastname', lastnameValue!);
    _persistentStorageService.saveUsername('cointag', cointagValue!);
    _next = true;
    notifyListeners();
  }

  @override
  void setFormStatus() {
    // log.v(setLastnameValidationMessage);
    setLastnameValidationMessage(toolNameValidator(value: lastnameValue ?? ""));
    setCointagValidationMessage(toolNameValidator(value: cointagValue ?? ""));
    setFirstnameValidationMessage(
        toolNameValidator(value: firstnameValue ?? ""));
    log.v(hasLastnameValidationMessage);
  }
}
