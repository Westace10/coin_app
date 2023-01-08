import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/views/onboarding/location/location_view.dart';
import 'package:coin_app/ui/views/onboarding/onboarding_viewmodel.dart';
import 'package:coin_app/ui/views/onboarding/otherUserInfo/otherinfo_view.dart';
import 'package:coin_app/ui/views/onboarding/password/password_view.dart';
import 'package:coin_app/ui/views/onboarding/userName/username_view.dart';
import 'package:coin_app/ui/views/onboarding/welcomeOnboard/welcomeonboard_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
      viewModelBuilder: (() => OnBoardingViewModel()),
      // onModelReady: ((model) => {}),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(color: kWhiteColor),
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: model.onBoardingController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      UserNameView(
                        nextPage: model.nextPage,
                      ),
                      PasswordView(
                        nextPage: model.nextPage,
                        prevPage: model.prevPage,
                      ),
                      OtherInfoView(
                        nextPage: model.nextPage,
                      ),
                      LocationView(
                        nextPage: model.nextPage,
                        prevPage: model.prevPage,
                      ),
                      const WelcomeOnboardView()
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
