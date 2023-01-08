import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/onboarding/otherUserInfo/otherinfo_view.form.dart';
import 'package:coin_app/ui/views/onboarding/otherUserInfo/otherinfo_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'firstname'),
  FormTextField(name: 'lastname'),
  FormTextField(name: 'cointag'),
])
class OtherInfoView extends StatelessWidget with $OtherInfoView {
  OtherInfoView({super.key, this.nextPage});

  final Function? nextPage;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtherInfoViewModel>.reactive(
      viewModelBuilder: (() => OtherInfoViewModel()),
      onModelReady: ((model) => syncFormWithViewModel(model)),
      onDispose: (_) => disposeForm(),
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
                                  "Let's get to know you",
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
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: InputField(
                                  labelText: "",
                                  hintText: "First Name",
                                  kPadding: 0.0,
                                  suffixIcon: true,
                                  inputController: firstnameController,
                                  color: Colors.transparent,
                                  hasValidationMessage:
                                      model.hasFirstnameValidationMessage,
                                  validationMessage:
                                      model.hasFirstnameValidationMessage
                                          ? model.firstnameValidationMessage
                                          : null,
                                  keyboardType: TextInputType.text,
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
                          Divider(
                            color: kBckgrdGradient.colors[0],
                            indent: 15,
                            endIndent: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: InputField(
                                  labelText: "",
                                  hintText: "Last Name",
                                  kPadding: 0.0,
                                  suffixIcon: true,
                                  inputController: lastnameController,
                                  color: Colors.transparent,
                                  hasValidationMessage:
                                      model.hasLastnameValidationMessage,
                                  validationMessage:
                                      model.hasLastnameValidationMessage
                                          ? model.lastnameValidationMessage
                                          : null,
                                  keyboardType: TextInputType.text,
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
                          Divider(
                            color: kBckgrdGradient.colors[0],
                            indent: 15,
                            endIndent: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: InputField(
                                  labelText: "",
                                  hintText: "Choose a \$Cointag",
                                  kPadding: 0.0,
                                  suffixIcon: true,
                                  inputController: cointagController,
                                  color: Colors.transparent,
                                  hasValidationMessage:
                                      model.hasCointagValidationMessage,
                                  validationMessage:
                                      model.hasCointagValidationMessage
                                          ? model.cointagValidationMessage
                                          : null,
                                  keyboardType: TextInputType.text,
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
                          Divider(
                            color: kBckgrdGradient.colors[0],
                            indent: 15,
                            endIndent: 15,
                          ),
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
                                title: "Next",
                                padding: kEdgeInsetsHorizontalSmall,
                                height: 45,
                                isBusy: model.isBusy,
                                disabled: model.disableCreateButton,
                                backgroundColor: kBckgrdGradient.colors[0],
                                onTap: (() async {
                                  await model.nextPage();
                                  model.next ? nextPage!() : null;
                                }),
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
