import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/onboarding/userName/username_view.form.dart';
import 'package:coin_app/ui/views/onboarding/userName/username_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
  FormTextField(name: 'otp'),
])
class UserNameView extends StatelessWidget with $UserNameView {
  UserNameView({super.key, this.nextPage});

  final Function? nextPage;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserNameViewModel>.reactive(
      viewModelBuilder: (() => UserNameViewModel()),
      onModelReady: ((model) => syncFormWithViewModel(model)),
      // onDispose: (_) => disposeForm(),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(color: kWhiteColor),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                padding: kEdgeInsetsHorizontalSmall,
                                onPressed: () {},
                                icon: Text(
                                  "?",
                                  style: GoogleFonts.familjenGrotesk(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    height: 1.0,
                                    color: kBlackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: kEdgeInsetsHorizontalSmall,
                            child: Row(
                              children: [
                                Text(
                                  "Enter Your Email",
                                  style: GoogleFonts.familjenGrotesk(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 24,
                                    height: 1.0,
                                    color: kBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: InputField(
                                  labelText: "",
                                  hintText: "Enter email",
                                  kPadding: 0.0,
                                  inputController: usernameController,
                                  color: Colors.transparent,
                                  suffixIcon: true,
                                  suffixWidget: AppButton(
                                    title: 'Send OTP',
                                    size: AppButtonSize.tiny,
                                    width: 50,
                                    // height: 50,
                                    padding: kEdgeInsetsZero,
                                    backgroundColor: kBckgrdGradient.colors[0],
                                    disabled: usernameController.text.isEmpty ||
                                        model.isBusy ||
                                        model.otpReady,
                                    isBusy: model.isBusy,
                                    onTap: () async {
                                      await model.onSendOTP();
                                    },
                                    // titleColor: kBckgrdGradient.colors[0]
                                  ),
                                  validationMessage:
                                      model.hasUsernameValidationMessage
                                          ? model.validationMessage
                                          : null,
                                  keyboardType: TextInputType.emailAddress,
                                  textStyle: GoogleFonts.familjenGrotesk(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    height: 1.0,
                                    color: kBlackColor,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          model.otpReady
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      child: InputField(
                                        labelText: "",
                                        hintText: "Enter OTP",
                                        kPadding: 0.0,
                                        inputController: otpController,
                                        color: Colors.transparent,
                                        validationMessage:
                                            model.hasUsernameValidationMessage
                                                ? model.validationMessage
                                                : null,
                                        keyboardType: TextInputType.number,
                                        textStyle: GoogleFonts.familjenGrotesk(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          height: 1.0,
                                          color: kBlackColor,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          Padding(
                            padding: kEdgeInsetsHorizontalSmall,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Text(
                                    "By entering and tapping Next, you agree to the Terms, E-Sign Consent & Privacy Policy",
                                    style: GoogleFonts.familjenGrotesk(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      height: 1.0,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppButton(
                                title: "Back",
                                padding: kEdgeInsetsHorizontalSmall,
                                // size: AppButtonSize.medium,
                                height: 45,
                                width: 150,
                                backgroundColor: kWhiteColor,
                                titleColor: kBckgrdGradient.colors[0],
                                borderColor: kBckgrdGradient.colors[0],
                                onTap: () {
                                  model.goBack();
                                },
                                // disabled: model.isBusy,
                              ),
                              AppButton(
                                title: "Next",
                                padding: kEdgeInsetsHorizontalSmall,
                                size: AppButtonSize.medium,
                                isBusy: model.isBusy,
                                height: 45,
                                width: 150,
                                backgroundColor: kBckgrdGradient.colors[0],
                                disabled: otpController.text.length < 6 ||
                                    model.isBusy ||
                                    !model.otpReady,
                                onTap: () async {
                                  await model.onNextClick();
                                  model.usernameAvailable ? nextPage!() : null;
                                },
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
