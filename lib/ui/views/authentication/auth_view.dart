import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/authentication/auth_view.form.dart';
import 'package:coin_app/ui/views/authentication/auth_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
    fields: [FormTextField(name: 'username'), FormTextField(name: 'password')])
class AuthView extends StatelessWidget with $AuthView {
  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: (() => AuthViewModel()),
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
                                  "Login",
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
                                  hintText: "Email",
                                  kPadding: 0.0,
                                  inputController: usernameController,
                                  color: Colors.transparent,
                                  validationMessage:
                                      model.hasUsernameValidationMessage
                                          ? model.usernameValidationMessage
                                          : null,
                                  keyboardType: model.isPhone
                                      ? TextInputType.phone
                                      : TextInputType.emailAddress,
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
                                  hintText: "Password",
                                  kPadding: 0.0,
                                  inputController: passwordController,
                                  color: Colors.transparent,
                                  validationMessage:
                                      model.hasPasswordValidationMessage
                                          ? model.passwordValidationMessage
                                          : null,
                                  keyboardType: model.isPhone
                                      ? TextInputType.phone
                                      : TextInputType.emailAddress,
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppButton(
                                title: "Forgot password",
                                padding: kEdgeInsetsHorizontalSmall,
                                size: AppButtonSize.small,
                                isBusy: model.isBusy,
                                height: 40,
                                width: 150,
                                titleColor: kPrimaryColor,
                                backgroundColor: kWhiteColor,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppButton(
                                title: "Create account",
                                padding: kEdgeInsetsHorizontalSmall,
                                // size: AppButtonSize.medium,
                                height: 45,
                                width: 150,
                                backgroundColor: kWhiteColor,
                                titleColor: kBckgrdGradient.colors[0],
                                borderColor: kBckgrdGradient.colors[0],
                                onTap: model.onCreateAccount,
                                disabled: model.isBusy,
                              ),
                              AppButton(
                                title: "Login",
                                padding: kEdgeInsetsHorizontalSmall,
                                size: AppButtonSize.medium,
                                isBusy: model.isBusy,
                                height: 45,
                                width: 150,
                                backgroundColor: kBckgrdGradient.colors[0],
                                disabled: model.disableCreateButton,
                                onTap: model.onLogin,
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
