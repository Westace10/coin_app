import 'package:coin_app/ui/shared/colors.dart';
import 'package:coin_app/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';

class AppThemeService {
  static AppThemeService? _instance;
  static ThemeService? _themeService;

  static Future<AppThemeService> getInstance() async {
    _instance ??= AppThemeService();
    _themeService ??= ThemeService.getInstance();

    return _instance!;
  }

  /// Holds values for light mode
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColorLight: kWhiteColor,
    primaryColor: kWhiteColor,
    brightness: Brightness.light,
    backgroundColor: kWhiteColor,
    scaffoldBackgroundColor: kWhiteColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: kBlackColor),
      foregroundColor: kBlackColor,
      elevation: 0,
      backgroundColor: kWhiteColor,
      titleTextStyle: kHeading2TextStyle.copyWith(
        color: kBlackColor,
      ),
    ),
    toggleableActiveColor: kWhiteColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: kBlackColor,
      brightness: Brightness.light,
    ),
  );

  /// Holds values for dark mode
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColorDark: kBlackColor,
    primaryColor: kBlackColor,
    brightness: Brightness.dark,
    backgroundColor: kBckgrdGradient.colors[1],
    scaffoldBackgroundColor: kBlackColor,
    primaryTextTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 150,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 125,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 100,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 80,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 60,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 180,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 90,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 45,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: kWhiteColor.withOpacity(0.7),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 150,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 125,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 100,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 50,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 35,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 180,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 90,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 45,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: kWhiteColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: kPrimaryColor),
      elevation: 0,
      color: kBlackColor,
      titleTextStyle: kHeading2TextStyle.copyWith(
        color: kPrimaryColor,
      ),
    ),
    // toggleableActiveColor: AppColor.kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: kPrimaryColor,
      brightness: Brightness.dark,
    ),
  );

  void changeTheme(bool value) {
    if (value) {
      _themeService!.setThemeMode(ThemeManagerMode.dark);
    } else {
      _themeService!.setThemeMode(ThemeManagerMode.light);
    }
  }
}
