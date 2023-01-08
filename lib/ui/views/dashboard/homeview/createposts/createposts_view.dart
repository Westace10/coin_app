import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/dashboard/homeview/createposts/createposts_view.form.dart';
import 'package:coin_app/ui/views/dashboard/homeview/createposts/createposts_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'posttitle'),
  FormTextField(name: 'postdata'),
])
class CreatepostView extends StatelessWidget with $CreatepostView {
  CreatepostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatepostViewModel>.reactive(
      viewModelBuilder: (() => CreatepostViewModel()),
      onModelReady: ((model) => syncFormWithViewModel(model)),
      onDispose: (_) => disposeForm(),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: Text(
                  "New post",
                  style: GoogleFonts.familjenGrotesk(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 1.0,
                    color: kBckgrdGradient.colors[0],
                  ),
                ),
                iconTheme: IconThemeData(
                  color: kBckgrdGradient.colors[0],
                  size: 20,
                ),
              ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: InputField(
                                  labelText: "",
                                  hintText: "Post Title",
                                  kPadding: 0.0,
                                  inputController: posttitleController,
                                  color: Colors.transparent,
                                  suffixIcon: false,
                                  validationMessage:
                                      model.hasPosttitleValidationMessage
                                          ? model.posttitleValidationMessage
                                          : null,
                                  keyboardType: TextInputType.emailAddress,
                                  textStyle: GoogleFonts.familjenGrotesk(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: InputField(
                                  minLines: 10,
                                  maxLines: 100,
                                  labelText: "",
                                  hintText: "Your post",
                                  kPadding: 0.0,
                                  inputController: postdataController,
                                  color: Colors.transparent,
                                  suffixIcon: false,
                                  validationMessage:
                                      model.hasPostdataValidationMessage
                                          ? model.postdataValidationMessage
                                          : null,
                                  keyboardType: TextInputType.emailAddress,
                                  textStyle: GoogleFonts.familjenGrotesk(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    height: 1.0,
                                    color: kBlackColor,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppButton(
                            title: "Create post",
                            padding: kEdgeInsetsHorizontalSmall,
                            size: AppButtonSize.medium,
                            isBusy: model.isBusy,
                            height: 45,
                            width: 150,
                            backgroundColor: kBckgrdGradient.colors[0],
                            disabled: postdataController.text.isEmpty ||
                                posttitleController.text.isEmpty ||
                                model.isBusy,
                            onTap: () {
                              model.createPost();
                            },
                          ),
                          verticalSpace100,
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
