import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/onboarding/location/location_view.form.dart';
import 'package:coin_app/ui/views/onboarding/location/location_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'zipcode'),
])
class LocationView extends StatelessWidget with $LocationView {
  LocationView({super.key, this.nextPage, this.prevPage});

  final Function? nextPage;
  final Function? prevPage;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      viewModelBuilder: (() => LocationViewModel()),
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
                                  "Your location",
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
                                width: MediaQuery.of(context).size.width,
                                child: InkWell(
                                  onTap: () {
                                    model.showCountries(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 28),
                                    child: Text(
                                      model.country == ""
                                          ? "Confirm yout country"
                                          : model.country,
                                      style: model.country == ""
                                          ? GoogleFonts.familjenGrotesk(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              height: 1.0,
                                              color: Colors.grey.shade300,
                                            )
                                          : GoogleFonts.familjenGrotesk(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              height: 1.0,
                                              color: kBlackColor,
                                            ),
                                    ),
                                  ),
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
                                  hintText: "ZIP Code",
                                  kPadding: 0.0,
                                  suffixIcon: true,
                                  inputController: zipcodeController,
                                  color: Colors.transparent,
                                  hasValidationMessage:
                                      model.hasZipcodeValidationMessage,
                                  validationMessage:
                                      model.hasZipcodeValidationMessage
                                          ? model.zipcodeValidationMessage
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
                                title: "Previous",
                                padding: kEdgeInsetsHorizontalSmall,
                                // size: AppButtonSize.medium,
                                height: 45,
                                width: 150,
                                backgroundColor: kWhiteColor,
                                titleColor: kBckgrdGradient.colors[0],
                                borderColor: kBckgrdGradient.colors[0],
                                onTap: (() => prevPage!()),
                                disabled: model.isBusy,
                              ),
                              AppButton(
                                title: "Finish",
                                padding: kEdgeInsetsHorizontalSmall,
                                size: AppButtonSize.medium,
                                height: 45,
                                width: 150,
                                isBusy: model.isBusy,
                                disabled: model.disableCreateButton,
                                backgroundColor: kBckgrdGradient.colors[0],
                                onTap: (() async {
                                  await model.updateAccount();
                                  model.finish ? nextPage!() : null;
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
