import 'package:coin_app/ui/shared/border_radius.dart';
import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchField extends StatefulWidget {
  final String? hintText;
  final double? kPadding;
  final String? validationMessage;
  final TextEditingController? inputController;
  final IconData? prefixIcon;
  final bool? suffixIcon;
  final bool isDisabled;
  final bool autoFocus;
  final TextStyle? textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormat;
  final Function? onChanged;

  const SearchField({
    super.key,
    this.hintText,
    this.kPadding,
    this.validationMessage,
    this.inputController,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.autoFocus = false,
    this.textStyle,
    this.color,
    this.textAlign,
    this.keyboardType,
    this.inputFormat,
    this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.kPadding ?? 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: normalBorderRadius,
              color: widget.color ?? Colors.transparent,
            ),
            child: TextFormField(
              textAlign: widget.textAlign ?? TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.inputController,
              autofocus: widget.autoFocus,
              readOnly: widget.isDisabled,
              obscureText: passwordVisibility,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              style: widget.textStyle ?? kSmallRegularTextStyle,
              inputFormatters: widget.inputFormat ?? [],
              onChanged: ((value) => {}),
              decoration: InputDecoration(
                prefixIcon: null == widget.prefixIcon
                    ? null
                    : Icon(
                        widget.prefixIcon,
                        color: AppColor.neutralColor.shade700,
                      ),
                suffix: widget.suffixIcon == true
                    ? Container(
                        transform: Matrix4.translationValues(0.0, 2.0, 0.0),
                        child: const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    : null,
                filled: widget.isDisabled == false ? null : true,
                hintText: widget.hintText ?? "Search here for tokens",
                hintStyle: const TextStyle(
                  color: kWhiteColor,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.color ?? kWhiteColor,
                    width: 1.0,
                  ),
                  borderRadius: normalBorderRadius,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kWhiteColor, width: 1.0),
                    borderRadius: normalBorderRadius),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColor.kErrorColor, width: 1.0),
                    borderRadius: normalBorderRadius),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.color ?? kWhiteColor, width: 1.0),
                    borderRadius: normalBorderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
