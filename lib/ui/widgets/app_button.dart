import 'package:coin_app/ui/shared/border_radius.dart';
import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:coin_app/ui/widgets/app_spinner.dart';
import 'package:flutter/material.dart';

import '../shared/spacing.dart';

enum AppButtonSize { tiny, small, medium, normal }

enum AppButtonType { elevated, outlined, circularWithLabel }

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool disabled;
  final bool isBusy;
  final AppButtonSize size;
  final String title;
  final Color? titleColor;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  final Color? borderColor;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? outlineButtonBorderColor;
  final AppButtonType _type;
  final String? icon;
  final Function? onClick;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    Key? key,
    this.width,
    this.disabled = false,
    required this.title,
    this.isBusy = false,
    this.titleColor = kWhiteColor,
    this.backgroundColor,
    this.height,
    this.padding,
    this.textStyle,
    this.size = AppButtonSize.normal,
    this.onTap,
    this.iconSize,
    this.borderColor,
    this.iconColor,
    this.leadingIcon,
    this.trailingIcon,
    this.outlineButtonBorderColor,
    this.icon,
    this.onClick,
  })  : _type = AppButtonType.elevated,
        super(key: key);

  const AppButton.outlined({
    Key? key,
    this.width,
    this.disabled = false,
    required this.title,
    this.isBusy = false,
    this.titleColor = kWhiteColor,
    this.backgroundColor,
    this.height,
    this.padding,
    this.textStyle,
    this.size = AppButtonSize.normal,
    this.onTap,
    this.iconSize,
    this.borderColor,
    this.iconColor,
    this.leadingIcon,
    this.trailingIcon,
    this.outlineButtonBorderColor,
    this.icon,
    this.onClick,
  })  : _type = AppButtonType.outlined,
        super(key: key);

  const AppButton.circularWithLabel({
    Key? key,
    this.width,
    this.disabled = false,
    required this.title,
    this.isBusy = false,
    this.titleColor = kWhiteColor,
    this.backgroundColor,
    this.height,
    this.padding,
    this.textStyle,
    this.size = AppButtonSize.normal,
    this.onTap,
    this.iconSize,
    this.borderColor,
    this.iconColor,
    this.leadingIcon,
    this.trailingIcon,
    this.outlineButtonBorderColor,
    this.icon,
    this.onClick,
  })  : _type = AppButtonType.circularWithLabel,
        super(key: key);

  double _getButtonHeight(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.tiny:
        return 20;
      case AppButtonSize.small:
        return 40;
      case AppButtonSize.medium:
        return 55;
      case AppButtonSize.normal:
        return 60;
    }
  }

  double _getButtonWidth(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.tiny:
        return 100;
      case AppButtonSize.small:
        return 120;
      case AppButtonSize.medium:
        return 200;
      case AppButtonSize.normal:
        return 350;
    }
  }

  TextStyle _getTextSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.tiny:
        return kSmallBoldTextStyle.copyWith(
          color: titleColor,
          fontSize: 9,
        );
      case AppButtonSize.small:
        return kBodyTextStyle.copyWith(
          color: titleColor,
        );
      case AppButtonSize.medium:
        return kSubtitleTextStyle.copyWith(
          color: titleColor,
        );
      case AppButtonSize.normal:
        return kSubtitleTextStyle.copyWith(
          color: titleColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case AppButtonType.elevated:
        return MaterialButton(
          disabledColor: AppColor.neutralColor.shade200,
          onPressed: disabled ? null : _onTap,
          color: backgroundColor ?? AppColor.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: normalBorderRadius,
          ),
          elevation: 0,
          child: Container(
            width: width ?? _getButtonWidth(size),
            height: height ?? _getButtonHeight(size),
            decoration: BoxDecoration(
              borderRadius: normalBorderRadius,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor ?? AppColor.kPrimaryColor.shade100)
                  : null,
            ),
            child: isBusy
                ? Center(
                    child: AppSpinner(
                    color: titleColor ?? kWhiteColor,
                    size: 15,
                  ))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leadingIcon != null) ...[
                        Icon(
                          leadingIcon,
                          size: iconSize,
                          color: iconColor,
                        ),
                        horizontalSpaceSmall
                      ],
                      Flexible(
                        child: Text(
                          title,
                          style: _getTextSize(size),
                        ),
                      ),
                      if (trailingIcon != null) ...[
                        horizontalSpaceMedium,
                        Icon(
                          trailingIcon,
                          size: iconSize,
                          color: iconColor,
                        ),
                      ]
                    ],
                  ),
          ),
        );
      case AppButtonType.outlined:
        return OutlinedButton(
          onPressed: disabled ? null : _onTap,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(
                color: outlineButtonBorderColor ?? AppColor.kPrimaryColor),
          ),
          child: Container(
            width: width ?? _getButtonWidth(size),
            height: height ?? _getButtonHeight(size),
            decoration: BoxDecoration(
              borderRadius: normalBorderRadius,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor ?? AppColor.kPrimaryColor.shade100)
                  : null,
            ),
            child: isBusy
                ? Center(
                    child: AppSpinner(
                    color: titleColor ?? kWhiteColor,
                    size: 15,
                  ))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leadingIcon != null) ...[
                        Icon(
                          leadingIcon,
                          size: iconSize,
                          color: iconColor,
                        ),
                        horizontalSpaceMedium
                      ],
                      Flexible(
                        child: Text(
                          title,
                          style: _getTextSize(size),
                        ),
                      ),
                      if (trailingIcon != null) ...[
                        horizontalSpaceMedium,
                        Icon(
                          trailingIcon,
                          size: iconSize,
                          color: iconColor,
                        ),
                      ]
                    ],
                  ),
          ),
        );
      case AppButtonType.circularWithLabel:
        return IconButton(
          padding: padding ?? const EdgeInsets.all(0.0),
          onPressed: onClick == null ? null : (() => onClick!()),
          icon: Wrap(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: icon == null
                        ? const Icon(
                            Icons.person,
                            color: kWhiteColor,
                          )
                        : Image.asset(icon!),
                  ),
                  Text(title, style: textStyle),
                ],
              ),
            ],
          ),
        );
    }
  }

  void _onTap() {
    if (!isBusy) onTap?.call();
  }
}
