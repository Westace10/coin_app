import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/edge_insets.dart';
import 'package:coin_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:coin_app/ui/views/dashboard/homeview/home_view.dart';
import 'package:coin_app/ui/views/dashboard/settingspage/settings_view.dart';
import 'package:coin_app/ui/views/dashboard/walletpage/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: (() => DashboardViewModel()),
      builder: ((context, model, child) => SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white30),
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    controller: model.dashboardController,
                    children: const [
                      HomeView(),
                      WalletView(),
                      SettingsView(),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: ((value) => model.onNavBarTap(value)),
                currentIndex: model.currentIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: kWhiteColor,
                showUnselectedLabels: true,
                selectedItemColor: kBckgrdGradient.colors[0],
                unselectedLabelStyle: GoogleFonts.familjenGrotesk(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 1.5,
                  color: kBckgrdGradient.colors[0],
                ),
                selectedLabelStyle: GoogleFonts.familjenGrotesk(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  height: 1.5,
                  color: kBckgrdGradient.colors[0],
                ),
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: kEdgeInsetsAllMini,
                      child: Icon(
                        Icons.roofing,
                        color: kBckgrdGradient.colors[0],
                      ),
                    ),
                    icon: Padding(
                      padding: kEdgeInsetsAllMini,
                      child: const Icon(
                        Icons.roofing_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: kEdgeInsetsAllMini,
                      child: Icon(
                        Icons.currency_bitcoin,
                        color: kBckgrdGradient.colors[0],
                      ),
                    ),
                    icon: Padding(
                      padding: kEdgeInsetsAllMini,
                      child: const Icon(
                        Icons.currency_bitcoin_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    label: "Wallet",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: kEdgeInsetsAllMini,
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: kBckgrdGradient.colors[0],
                      ),
                    ),
                    icon: Padding(
                      padding: kEdgeInsetsAllMini,
                      child: const Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                      ),
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
