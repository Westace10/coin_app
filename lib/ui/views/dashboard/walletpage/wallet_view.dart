import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/shared/spacing.dart';
import 'package:coin_app/ui/views/dashboard/walletpage/wallet_viewmodel.dart';
import 'package:coin_app/ui/widgets/app_button.dart';
import 'package:coin_app/ui/widgets/balance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewModel>.reactive(
      viewModelBuilder: (() => WalletViewModel()),
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
                          TextButton(
                            onPressed: () {
                              model.connectWallet();
                            },
                            child: Text(
                              "Connect CB Wallet",
                              style: GoogleFonts.familjenGrotesk(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1.0,
                                color: kBckgrdGradient.colors[0],
                              ),
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
                  decoration: const BoxDecoration(color: kWhiteColor),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const Balance(
                        heading: "Your Earnings",
                      ),
                      verticalSpaceMicro,
                      Padding(
                        padding: kEdgeInsetsHorizontalNormal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppButton(
                              title: "Request fund",
                              padding: kEdgeInsetsHorizontalSmall,
                              size: AppButtonSize.small,
                              isBusy: model.isBusy,
                              height: 40,
                              width: 120,
                              backgroundColor: kBckgrdGradient.colors[0],
                              onTap: () {},
                            ),
                            AppButton(
                              title: "Send fund",
                              padding: kEdgeInsetsHorizontalSmall,
                              size: AppButtonSize.small,
                              isBusy: model.isBusy,
                              height: 40,
                              width: 120,
                              backgroundColor: kBckgrdGradient.colors[0],
                              onTap: () {},
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert))
                          ],
                        ),
                      ),
                      Padding(
                        padding: kEdgeInsetsAllNormal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transaction history",
                              style: GoogleFonts.familjenGrotesk(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.5,
                                height: 1.5,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "See All",
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
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: kBckgrdGradient.colors[0]
                                        .withOpacity(0.3),
                                    child: const Icon(Icons.call_made),
                                  ),
                                  title: const Text("John Doe"),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Bank Account"),
                                      Icon(
                                        Icons.adjust,
                                        size: 14,
                                        color: kBckgrdGradient.colors[0],
                                      ),
                                      Text(DateTime.now().toIso8601String()),
                                      Container(),
                                    ],
                                  ),
                                ))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
