// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String PosttitleValueKey = 'posttitle';
const String PostdataValueKey = 'postdata';

final Map<String, TextEditingController> _CreatepostViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CreatepostViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CreatepostViewTextValidations = {
  PosttitleValueKey: null,
  PostdataValueKey: null,
};

mixin $CreatepostView on StatelessWidget {
  TextEditingController get posttitleController =>
      _getFormTextEditingController(PosttitleValueKey);
  TextEditingController get postdataController =>
      _getFormTextEditingController(PostdataValueKey);
  FocusNode get posttitleFocusNode => _getFormFocusNode(PosttitleValueKey);
  FocusNode get postdataFocusNode => _getFormFocusNode(PostdataValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CreatepostViewTextEditingControllers.containsKey(key)) {
      return _CreatepostViewTextEditingControllers[key]!;
    }
    _CreatepostViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreatepostViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreatepostViewFocusNodes.containsKey(key)) {
      return _CreatepostViewFocusNodes[key]!;
    }
    _CreatepostViewFocusNodes[key] = FocusNode();
    return _CreatepostViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    posttitleController.addListener(() => _updateFormData(model));
    postdataController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    posttitleController.addListener(() => _updateFormData(model));
    postdataController.addListener(() => _updateFormData(model));
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
          PosttitleValueKey: posttitleController.text,
          PostdataValueKey: postdataController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        PosttitleValueKey: _getValidationMessage(PosttitleValueKey),
        PostdataValueKey: _getValidationMessage(PostdataValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CreatepostViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_CreatepostViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreatepostViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreatepostViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreatepostViewTextEditingControllers.clear();
    _CreatepostViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get posttitleValue => this.formValueMap[PosttitleValueKey] as String?;
  String? get postdataValue => this.formValueMap[PostdataValueKey] as String?;

  bool get hasPosttitle =>
      this.formValueMap.containsKey(PosttitleValueKey) &&
      (posttitleValue?.isNotEmpty ?? false);
  bool get hasPostdata =>
      this.formValueMap.containsKey(PostdataValueKey) &&
      (postdataValue?.isNotEmpty ?? false);

  bool get hasPosttitleValidationMessage =>
      this.fieldsValidationMessages[PosttitleValueKey]?.isNotEmpty ?? false;
  bool get hasPostdataValidationMessage =>
      this.fieldsValidationMessages[PostdataValueKey]?.isNotEmpty ?? false;

  String? get posttitleValidationMessage =>
      this.fieldsValidationMessages[PosttitleValueKey];
  String? get postdataValidationMessage =>
      this.fieldsValidationMessages[PostdataValueKey];
}

extension Methods on FormViewModel {
  setPosttitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PosttitleValueKey] = validationMessage;
  setPostdataValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PostdataValueKey] = validationMessage;
}
