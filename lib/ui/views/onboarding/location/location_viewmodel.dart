import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.logger.dart';
import 'package:coin_app/core/services/api_services.dart';
import 'package:coin_app/core/services/local_storage/persistent_storage_service.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:coin_app/ui/views/onboarding/location/location_view.form.dart';

class LocationViewModel extends FormViewModel {
  final log = getLogger("PasswordViewModel");
  final _persistentStorageService = locator<PersistentStorageService>();
  final _apiService = locator<APIService>();

  bool _finish = false;
  bool get finish => _finish;

  String _country = '';
  String get country => _country;

  showCountries(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode:
          false, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        _country = country.name;
        notifyListeners();
        _persistentStorageService.saveUsername("country", country.name);
        log.v(country.name);
      },
    );
  }

  bool get disableCreateButton =>
      !isFormValid ||
      zipcodeValue == '' ||
      zipcodeValue == null ||
      _country == '';

  updateAccount() async {
    setBusy(true);
    final firstname = _persistentStorageService.getData('firstname').toString();
    final lastname = _persistentStorageService.getData('lastname').toString();
    final cointag = _persistentStorageService.getData('cointag').toString();
    final accountid = _persistentStorageService
        .getData('accountid')
        .toString()
        .replaceAll('"', "");

    await _apiService.patch(
      "tutorial:main/tables/Users/data/$accountid?columns=id",
      {
        "lastname": firstname,
        "firstname": lastname,
        "cointag": {"id": cointag},
        "address": {
          "city": _country,
          "zipcode": int.parse(zipcodeValue!),
        }
      },
    ).then((value) async {
      _finish = true;
      notifyListeners();
      log.v(value);
    }).onError((error, stackTrace) {
      log.v(error);
      log.v(stackTrace);
    });
    setBusy(false);
  }

  @override
  void setFormStatus() {
    // (passwordValidator(value: passwordValue ?? ""));
    // setConfirmPasswordValidationMessage(confirmPasswordValidator(
    //     value: confirmPasswordValue ?? "",
    //     newPasswordValue: passwordValue ?? ""));
  }
}
