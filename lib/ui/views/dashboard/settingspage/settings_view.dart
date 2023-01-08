import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/views/dashboard/settingspage/settings_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/app_spinner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: (() => SettingsViewModel()),
      onModelReady: ((model) => model.getDetails()),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  "Profile",
                  style: GoogleFonts.familjenGrotesk(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 1.0,
                    color: kBckgrdGradient.colors[0],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(color: kWhiteColor),
                  height: MediaQuery.of(context).size.height,
                  child: model.isBusy
                      ? Center(
                          child: AppSpinner(
                          color: kBckgrdGradient.colors[0],
                        ))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kBckgrdGradient.colors[0],
                                    radius: 100,
                                    child: Text(
                                      model.initials,
                                      style: GoogleFonts.familjenGrotesk(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 56,
                                        height: 1.0,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$${model.cointag}",
                                    style: GoogleFonts.familjenGrotesk(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      height: 1.5,
                                      color: kBckgrdGradient.colors[0],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: kEdgeInsetsAllNormal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Name",
                                          style: GoogleFonts.familjenGrotesk(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            height: 1.5,
                                            color: kBckgrdGradient.colors[0],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            model.name,
                                            style: GoogleFonts.familjenGrotesk(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.5,
                                              height: 1.5,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: kEdgeInsetsAllNormal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Email",
                                          style: GoogleFonts.familjenGrotesk(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            height: 1.5,
                                            color: kBckgrdGradient.colors[0],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            model.email,
                                            style: GoogleFonts.familjenGrotesk(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.5,
                                              height: 1.5,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: kEdgeInsetsAllNormal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Password",
                                          style: GoogleFonts.familjenGrotesk(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            height: 1.5,
                                            color: kBckgrdGradient.colors[0],
                                          ),
                                        ),
                                        AppButton(
                                          title: "Update password",
                                          padding: kEdgeInsetsHorizontalSmall,
                                          size: AppButtonSize.small,
                                          isBusy: model.isBusy,
                                          height: 40,
                                          width: 150,
                                          backgroundColor: kPrimaryColor,
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppButton(
                                    title: "Logout",
                                    padding: kEdgeInsetsHorizontalSmall,
                                    size: AppButtonSize.small,
                                    isBusy: model.isBusy,
                                    height: 40,
                                    width: 150,
                                    titleColor: Colors.red,
                                    backgroundColor: kWhiteColor,
                                    onTap: () {
                                      model.logout();
                                    },
                                  ),
                                ],
                              ),
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
