import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingPostButton extends StatelessWidget {
  FloatingPostButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: kEdgeInsetsZero,
            foregroundColor: kWhiteColor,
            backgroundColor: kBckgrdGradient.colors[0],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            onPressed!();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text("Post"),
          ),
        ),
      ],
    );
  }
}
