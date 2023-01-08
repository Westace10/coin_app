// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FirstnameValueKey = 'firstname';
const String LastnameValueKey = 'lastname';
const String CointagValueKey = 'cointag';

final Map<String, TextEditingController> _OtherInfoViewTextEditingControllers =
    {};

final Map<String, FocusNode> _OtherInfoViewFocusNodes = {};

final Map<String, String? Function(String?)?> _OtherInfoViewTextValidations = {
  FirstnameValueKey: null,
  LastnameValueKey: null,
  CointagValueKey: null,
};

mixin $OtherInfoView on StatelessWidget {
  TextEditingController get firstnameController =>
      _getFormTextEditingController(FirstnameValueKey);
  TextEditingController get lastnameController =>
      _getFormTextEditingController(LastnameValueKey);
  TextEditingController get cointagController =>
      _getFormTextEditingController(CointagValueKey);
  FocusNode get firstnameFocusNode => _getFormFocusNode(FirstnameValueKey);
  FocusNode get lastnameFocusNode => _getFormFocusNode(LastnameValueKey);
  FocusNode get cointagFocusNode => _getFormFocusNode(CointagValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_OtherInfoViewTextEditingControllers.containsKey(key)) {
      return _OtherInfoViewTextEditingControllers[key]!;
    }
    _OtherInfoViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _OtherInfoViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_OtherInfoViewFocusNodes.containsKey(key)) {
      return _OtherInfoViewFocusNodes[key]!;
    }
    _OtherInfoViewFocusNodes[key] = FocusNode();
    return _OtherInfoViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    firstnameController.addListener(() => _updateFormData(model));
    lastnameController.addListener(() => _updateFormData(model));
    cointagController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    firstnameController.addListener(() => _updateFormData(model));
    lastnameController.addListener(() => _updateFormData(model));
    cointagController.addListener(() => _updateFormData(model));
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
          FirstnameValueKey: firstnameController.text,
          LastnameValueKey: lastnameController.text,
          CointagValueKey: cointagController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        FirstnameValueKey: _getValidationMessage(FirstnameValueKey),
        LastnameValueKey: _getValidationMessage(LastnameValueKey),
        CointagValueKey: _getValidationMessage(CointagValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _OtherInfoViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_OtherInfoViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _OtherInfoViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _OtherInfoViewFocusNodes.values) {
      focusNode.dispose();
    }

    _OtherInfoViewTextEditingControllers.clear();
    _OtherInfoViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get firstnameValue => this.formValueMap[FirstnameValueKey] as String?;
  String? get lastnameValue => this.formValueMap[LastnameValueKey] as String?;
  String? get cointagValue => this.formValueMap[CointagValueKey] as String?;

  bool get hasFirstname =>
      this.formValueMap.containsKey(FirstnameValueKey) &&
      (firstnameValue?.isNotEmpty ?? false);
  bool get hasLastname =>
      this.formValueMap.containsKey(LastnameValueKey) &&
      (lastnameValue?.isNotEmpty ?? false);
  bool get hasCointag =>
      this.formValueMap.containsKey(CointagValueKey) &&
      (cointagValue?.isNotEmpty ?? false);

  bool get hasFirstnameValidationMessage =>
      this.fieldsValidationMessages[FirstnameValueKey]?.isNotEmpty ?? false;
  bool get hasLastnameValidationMessage =>
      this.fieldsValidationMessages[LastnameValueKey]?.isNotEmpty ?? false;
  bool get hasCointagValidationMessage =>
      this.fieldsValidationMessages[CointagValueKey]?.isNotEmpty ?? false;

  String? get firstnameValidationMessage =>
      this.fieldsValidationMessages[FirstnameValueKey];
  String? get lastnameValidationMessage =>
      this.fieldsValidationMessages[LastnameValueKey];
  String? get cointagValidationMessage =>
      this.fieldsValidationMessages[CointagValueKey];
}

extension Methods on FormViewModel {
  setFirstnameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstnameValueKey] = validationMessage;
  setLastnameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastnameValueKey] = validationMessage;
  setCointagValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CointagValueKey] = validationMessage;
}
