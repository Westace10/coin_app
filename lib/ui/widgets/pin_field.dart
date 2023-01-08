import 'package:coin_app/ui/shared/border_radius.dart';
import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class PinInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final double? kPadding;
  final String? validationMessage;
  final TextEditingController? inputController;
  final IconData? prefixIcon;
  final bool? suffixIcon;
  final bool isDisabled;
  final bool autoFocus;
  final bool hasValidationMessage;

  //final VoidCallback onChanged;

  const PinInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.kPadding,
    this.validationMessage,
    this.inputController,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.autoFocus = false,
    this.hasValidationMessage = false,
  });

  @override
  State<PinInputField> createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.kPadding ?? 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: normalBorderRadius,
              color: kInputBoxColor,
            ),
            child: TextFormField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.inputController,
              autofocus: widget.autoFocus,
              readOnly: widget.isDisabled,
              obscureText: passwordVisibility,
              keyboardType: TextInputType.text,
              style: kSmallRegularTextStyle,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                prefixIcon: null == widget.prefixIcon
                    ? null
                    : Icon(
                        widget.prefixIcon,
                        color: AppColor.neutralColor.shade700,
                      ),
                suffix: widget.suffixIcon == true
                    ? Container(
                        transform: Matrix4.translationValues(0.0, 2.0, 0.0),
                        child: Icon(
                          passwordVisibility
                              ? Icons.check_circle_outline
                              : null,
                          color: Colors.green,
                          size: 18,
                        ),
                      )
                    : null,
                filled: widget.isDisabled == false ? null : true,
                // filled: true,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: kBlackColor,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kInputBoxColor,
                    width: 1.0,
                  ),
                  borderRadius: normalBorderRadius,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.isDisabled == true
                            ? kWhiteColor
                            : kInputBoxColor,
                        width: 1.0),
                    borderRadius: normalBorderRadius),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColor.kErrorColor, width: 1.0),
                    borderRadius: normalBorderRadius),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kInputBoxColor, width: 1.0),
                    borderRadius: normalBorderRadius),
              ),
            ),
          ),
          Text(
            widget.validationMessage ?? '',
            style: kValidationTextStyle,
          ),
        ],
      ),
    );
  }
}
