import 'package:coin_app/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    Key? key,
    required this.label,
    required this.value,
    required this.onTextInput,
    required this.onBackSpace,
    required this.isShow,
    required this.visibility,
    this.flex = 1,
  }) : super(key: key);
  final dynamic label;
  final dynamic value;
  final ValueSetter<String>? onTextInput;
  final Function onBackSpace;
  final Function visibility;
  final bool isShow;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: AspectRatio(
        aspectRatio: 2,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (label is Widget) {
                  onBackSpace();
                } else if (label is String && label.toString().length == 4) {
                  visibility.call();
                } else {
                  onTextInput?.call(label);
                }
              },
              child: Center(
                child: label is Widget
                    ? label
                    : label.length == 4 && isShow
                        ? Text(
                            'Hide',
                            style: GoogleFonts.familjenGrotesk(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.5,
                              color: kWhiteColor,
                            ),
                          )
                        : Text(
                            label,
                            style: GoogleFonts.familjenGrotesk(
                              fontWeight: label == "Show"
                                  ? FontWeight.w400
                                  : FontWeight.w500,
                              fontSize: label == "Show" ? 16 : 24,
                              height: 1.5,
                              color: kWhiteColor,
                            ),
                          ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
