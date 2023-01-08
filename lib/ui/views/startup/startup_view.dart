import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:coin_app/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        // backgroundColor: kBckgrdGradient.colors[1],
        // appBar: AppBar(),
        // extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(gradient: kBckgrdGradient),
          child: Center(
              child: Text(
            "Coin App",
            style: kHeadingTitle.copyWith(color: kWhiteColor),
          )),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
