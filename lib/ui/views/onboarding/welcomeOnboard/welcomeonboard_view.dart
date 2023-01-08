import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:coin_app/ui/views/onboarding/welcomeOnboard/welcomeonboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WelcomeOnboardView extends StatelessWidget {
  const WelcomeOnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeOnboardViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: kBckgrdGradient.colors[0],
              size: 100,
            ),
            Text(
              "Welcome",
              style: kHeadingTitle,
            ),
          ],
        )),
      ),
      viewModelBuilder: () => WelcomeOnboardViewModel(),
    );
  }
}
