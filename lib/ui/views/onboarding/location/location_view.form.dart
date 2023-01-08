// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ZipcodeValueKey = 'zipcode';

final Map<String, TextEditingController> _LocationViewTextEditingControllers =
    {};

final Map<String, FocusNode> _LocationViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LocationViewTextValidations = {
  ZipcodeValueKey: null,
};

mixin $LocationView on StatelessWidget {
  TextEditingController get zipcodeController =>
      _getFormTextEditingController(ZipcodeValueKey);
  FocusNode get zipcodeFocusNode => _getFormFocusNode(ZipcodeValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_LocationViewTextEditingControllers.containsKey(key)) {
      return _LocationViewTextEditingControllers[key]!;
    }
    _LocationViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LocationViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LocationViewFocusNodes.containsKey(key)) {
      return _LocationViewFocusNodes[key]!;
    }
    _LocationViewFocusNodes[key] = FocusNode();
    return _LocationViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    zipcodeController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    zipcodeController.addListener(() => _updateFormData(model));
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
          ZipcodeValueKey: zipcodeController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        ZipcodeValueKey: _getValidationMessage(ZipcodeValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _LocationViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_LocationViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _LocationViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LocationViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LocationViewTextEditingControllers.clear();
    _LocationViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get zipcodeValue => this.formValueMap[ZipcodeValueKey] as String?;

  bool get hasZipcode =>
      this.formValueMap.containsKey(ZipcodeValueKey) &&
      (zipcodeValue?.isNotEmpty ?? false);

  bool get hasZipcodeValidationMessage =>
      this.fieldsValidationMessages[ZipcodeValueKey]?.isNotEmpty ?? false;

  String? get zipcodeValidationMessage =>
      this.fieldsValidationMessages[ZipcodeValueKey];
}

extension Methods on FormViewModel {
  setZipcodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ZipcodeValueKey] = validationMessage;
}
