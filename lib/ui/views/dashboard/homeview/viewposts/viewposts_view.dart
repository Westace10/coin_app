import 'package:coin_app/core/models/posts_query_model.dart';
import 'package:coin_app/ui/shared/border_radius.dart';
import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/dashboard/homeview/viewposts/viewposts_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class ViewpostView extends StatelessWidget {
  const ViewpostView({super.key, this.postData});

  final Record? postData;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewpostViewModel>.reactive(
      // onModelReady: ((model) => model.init()),
      viewModelBuilder: (() => ViewpostViewModel()),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: Text(
                  postData!.title!,
                  style: GoogleFonts.familjenGrotesk(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 1.0,
                    color: kBckgrdGradient.colors[0],
                  ),
                ),
              ),
              body: Container(
                  decoration: const BoxDecoration(color: kWhiteColor),
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: kEdgeInsetsAllNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Text(postData!.text!),
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Posted at: ${postData!.createdAt!}"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: mediumBorderRadius,
                                    color: kBckgrdGradient.colors[0],
                                  ),
                                  child: Padding(
                                    padding: kEdgeInsetsAllMini,
                                    child: Row(
                                      children: [
                                        Wrap(
                                          children: [
                                            Text(
                                              postData!.views.toString(),
                                              style:
                                                  GoogleFonts.familjenGrotesk(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                height: 1.0,
                                                color: kWhiteColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        horizontalSpaceTiny,
                                        Text(
                                          "Views",
                                          style: GoogleFonts.familjenGrotesk(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            height: 1.0,
                                            color: kWhiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.favorite),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        // Text()
                      ],
                    ),
                  )),
            ),
          )),
    );
  }
}
