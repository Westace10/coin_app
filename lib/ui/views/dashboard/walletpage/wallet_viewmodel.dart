import 'package:coin_app/app/app.logger.dart';
import 'package:coinbase_wallet_sdk/coinbase_wallet_sdk.dart';
import 'package:coinbase_wallet_sdk/eth_web3_rpc.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletViewModel extends BaseViewModel {
  final PageController _dashboardController = PageController();
  PageController get dashboardController => _dashboardController;

  final log = getLogger("WalletViewModel");

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  Future<void> connectWallet() async {
    // To call web3's eth_requestAccounts

    await CoinbaseWalletSDK.shared.isAppInstalled().then((value) async {
      if (value) {
        log.v(value);
        await CoinbaseWalletSDK.shared.initiateHandshake([
          const RequestAccounts(),
        ]).then((value) => {log.v(value)});
      } else {
        launchInWebView(Uri.parse(
            "https://play.google.com/store/apps/details?id=com.coinbase.android&hl=en&gl=US"));
        log.v(!value);
      }
    });
  }

  Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
    )) {
      throw 'Could not launch $url';
    }
  }

  void onNavBarTap(int value) async {
    _dashboardController.jumpToPage(value);
    _currentIndex = value;
    notifyListeners();
  }
}
