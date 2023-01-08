import 'package:coinbase_wallet_sdk/coinbase_wallet_sdk.dart';
import 'package:coinbase_wallet_sdk/configuration.dart';

configureCoinbase() async {
  // Configure SDK for each platform
  await CoinbaseWalletSDK.shared.configure(
    Configuration(
      ios: IOSConfiguration(
        host: Uri.parse('https://goerli.ethereum.coinbasecloud.net'),
        callback: Uri.parse('tribesxyz://mycallback'),
      ),
      android: AndroidConfiguration(
        domain: Uri.parse('https://goerli.ethereum.coinbasecloud.net'),
      ),
    ),
  );
}
