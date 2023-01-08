import 'package:coin_app/app/app.locator.dart';
import 'package:coin_app/app/app.router.dart';
import 'package:coin_app/core/services/app_theme_service.dart';
import 'package:coin_app/core/services/coinbase_services.dart';
import 'package:coin_app/core/services/local_storage/local_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  await ThemeManager.initialise();
  await configureCoinbase();
  await openHiveBoxes();
  await dotenv.load(fileName: "lib/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      statusBarColorBuilder: (theme) => theme!.backgroundColor,
      defaultThemeMode: ThemeMode.light,
      darkTheme: AppThemeService.darkTheme,
      lightTheme: AppThemeService.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        title: 'Coin App',
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
      ),
    );
  }
}
