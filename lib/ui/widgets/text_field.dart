import 'package:coin_app/ui/shared/border_radius.dart';
import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? kPadding;
  final String? validationMessage;
  final TextEditingController? inputController;
  final IconData? prefixIcon;
  final bool? suffixIcon;
  final bool isDisabled;
  final bool autoFocus;
  final bool hasValidationMessage;
  final TextStyle? textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;
  final List<TextInputFormatter>? inputFormat;
  final Function? onTap;
  final int? minLines;
  final int? maxLines;

  //final VoidCallback onChanged;

  const InputField(
      {super.key,
      this.labelText,
      this.hintText,
      this.kPadding,
      this.validationMessage,
      this.inputController,
      this.prefixIcon,
      this.suffixIcon,
      this.isDisabled = false,
      this.autoFocus = false,
      this.hasValidationMessage = false,
      this.textStyle,
      this.color,
      this.textAlign,
      this.keyboardType,
      this.suffixWidget,
      this.inputFormat,
      this.onTap,
      this.maxLines,
      this.minLines});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.kPadding ?? 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText!,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: normalBorderRadius,
              color: widget.color ?? kInputBoxColor,
            ),
            child: TextFormField(
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              textAlign: widget.textAlign ?? TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.inputController,
              autofocus: widget.autoFocus,
              readOnly: widget.isDisabled,
              obscureText: passwordVisibility,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              style: widget.textStyle ?? kSmallRegularTextStyle,
              inputFormatters: widget.inputFormat ?? [],
              onTap: widget.onTap == null ? null : widget.onTap!(),
              decoration: InputDecoration(
                prefixIcon: null == widget.prefixIcon
                    ? null
                    : Icon(
                        widget.prefixIcon,
                        color: AppColor.neutralColor.shade700,
                      ),
                suffix: widget.suffixIcon == true ? widget.suffixWidget : null,
                filled: widget.isDisabled == false ? null : true,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade300,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.color ?? kInputBoxColor,
                    width: 1.0,
                  ),
                  borderRadius: normalBorderRadius,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.isDisabled
                            ? kWhiteColor
                            : widget.color ?? kInputBoxColor,
                        width: 1.0),
                    borderRadius: normalBorderRadius),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColor.kErrorColor, width: 1.0),
                    borderRadius: normalBorderRadius),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.color ?? kInputBoxColor, width: 1.0),
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
