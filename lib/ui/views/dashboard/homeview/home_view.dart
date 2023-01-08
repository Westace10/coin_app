import 'package:coin_app/ui/shared/border_radius.dart';
import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/dashboard/homeview/home_viewmodel.dart';
import 'package:coin_app/ui/views/dashboard/widgets/floating_post_button.dart';
import 'package:coin_app/ui/widgets/app_spinner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: ((model) => model.init()),
      viewModelBuilder: (() => HomeViewModel()),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: kEdgeInsetsHorizontalTiny,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor: kBckgrdGradient.colors[0],
                          child: const Text("A"),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: kBckgrdGradient.colors[0],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_rounded,
                              color: kBckgrdGradient.colors[0],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  height: MediaQuery.of(context).size.height,
                  child: model.isBusy
                      ? Center(
                          child: AppSpinner(
                          color: kBckgrdGradient.colors[0],
                        ))
                      : Stack(
                          children: [
                            ListView.builder(
                              itemCount: model.postData!.length,
                              itemBuilder: ((context, index) => model.isBusy
                                  ? Center(
                                      child: AppSpinner(
                                      color: kBckgrdGradient.colors[0],
                                    ))
                                  : InkWell(
                                      onTap: (() => model
                                          .onCardTap(model.postData![index])),
                                      child: Container(
                                        margin: kEdgeInsetsAllSmall,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        height: 280,
                                        decoration: BoxDecoration(
                                          borderRadius: smallBorderRadius,
                                          color: kWhiteColor,
                                        ),
                                        child: Padding(
                                          padding: kEdgeInsetsAllNormal,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                contentPadding: kEdgeInsetsZero,
                                                isThreeLine: false,
                                                title: Text(
                                                  model
                                                      .postData![index]!.title!,
                                                  style: GoogleFonts
                                                      .familjenGrotesk(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    height: 1.2,
                                                    color: kBckgrdGradient
                                                        .colors[0],
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  "Posted: ${model.postData![index]!.createdAt!}",
                                                  style: GoogleFonts
                                                      .familjenGrotesk(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16,
                                                    height: 1.5,
                                                    color: kBckgrdGradient
                                                        .colors[0],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                                height: 100,
                                                child: Text(
                                                  model.postData![index]!.text!,
                                                  style: GoogleFonts
                                                      .familjenGrotesk(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                    height: 1.3,
                                                    color: kBckgrdGradient
                                                        .colors[0],
                                                  ),
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            mediumBorderRadius,
                                                        color: kBckgrdGradient
                                                            .colors[0],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            kEdgeInsetsAllMini,
                                                        child: Row(
                                                          children: [
                                                            Wrap(
                                                              children: [
                                                                Text(
                                                                  model
                                                                      .postData![
                                                                          index]!
                                                                      .views!
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .familjenGrotesk(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        14,
                                                                    height: 1.0,
                                                                    color:
                                                                        kWhiteColor,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            horizontalSpaceTiny,
                                                            Text(
                                                              "Views",
                                                              style: GoogleFonts
                                                                  .familjenGrotesk(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 14,
                                                                height: 1.0,
                                                                color:
                                                                    kWhiteColor,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.share),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.favorite),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                            ),
                            Positioned(
                              right: 40,
                              bottom: 150,
                              child: FloatingPostButton(
                                onPressed: () {
                                  model.goToCreatePost();
                                },
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
