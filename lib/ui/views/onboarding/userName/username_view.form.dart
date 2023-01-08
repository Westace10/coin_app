// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String UsernameValueKey = 'username';
const String OtpValueKey = 'otp';

final Map<String, TextEditingController> _UserNameViewTextEditingControllers =
    {};

final Map<String, FocusNode> _UserNameViewFocusNodes = {};

final Map<String, String? Function(String?)?> _UserNameViewTextValidations = {
  UsernameValueKey: null,
  OtpValueKey: null,
};

mixin $UserNameView on StatelessWidget {
  TextEditingController get usernameController =>
      _getFormTextEditingController(UsernameValueKey);
  TextEditingController get otpController =>
      _getFormTextEditingController(OtpValueKey);
  FocusNode get usernameFocusNode => _getFormFocusNode(UsernameValueKey);
  FocusNode get otpFocusNode => _getFormFocusNode(OtpValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_UserNameViewTextEditingControllers.containsKey(key)) {
      return _UserNameViewTextEditingControllers[key]!;
    }
    _UserNameViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UserNameViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UserNameViewFocusNodes.containsKey(key)) {
      return _UserNameViewFocusNodes[key]!;
    }
    _UserNameViewFocusNodes[key] = FocusNode();
    return _UserNameViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));
    otpController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));
    otpController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UsernameValueKey: usernameController.text,
          OtpValueKey: otpController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        UsernameValueKey: _getValidationMessage(UsernameValueKey),
        OtpValueKey: _getValidationMessage(OtpValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _UserNameViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_UserNameViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _UserNameViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UserNameViewFocusNodes.values) {
      focusNode.dispose();
    }

    _UserNameViewTextEditingControllers.clear();
    _UserNameViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get usernameValue => this.formValueMap[UsernameValueKey] as String?;
  String? get otpValue => this.formValueMap[OtpValueKey] as String?;

  bool get hasUsername =>
      this.formValueMap.containsKey(UsernameValueKey) &&
      (usernameValue?.isNotEmpty ?? false);
  bool get hasOtp =>
      this.formValueMap.containsKey(OtpValueKey) &&
      (otpValue?.isNotEmpty ?? false);

  bool get hasUsernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey]?.isNotEmpty ?? false;
  bool get hasOtpValidationMessage =>
      this.fieldsValidationMessages[OtpValueKey]?.isNotEmpty ?? false;

  String? get usernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey];
  String? get otpValidationMessage =>
      this.fieldsValidationMessages[OtpValueKey];
}

extension Methods on FormViewModel {
  setUsernameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UsernameValueKey] = validationMessage;
  setOtpValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OtpValueKey] = validationMessage;
}
