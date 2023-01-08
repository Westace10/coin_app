import 'package:flutter/material.dart';

// colors
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kBlackColor = Color(0xFF000000);
const Color kPrimaryColor = Color(0xFF0075FF);
const Color kPrimaryColorFade = Color(0xFF000000);
const Color kSecondaryColor = Color(0xFF0F051D);
const Color kInputBoxColor = Color(0xFF4D5DA5);
const Color kGainLineColor = Color(0xFF00D563);
const Color kLossLineColor = Color(0xFFF02052);
const Color kChartColor = Color(0xFF0E1246);

const Color kpinBorderRadiusColor = Color.fromRGBO(234, 239, 243, 1);
Color kTransparent = const Color(0xFF000000).withOpacity(0.0);

//gradients
const LinearGradient kBckgrdGradient = LinearGradient(
  colors: [
    Color(0xFF1D0E3D),
    Color(0xFF0F051D),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
const LinearGradient kBckgrdGradientInverse = LinearGradient(
  colors: [
    Color(0xFF0F051D),
    Color(0xFF1D0E3D),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
LinearGradient kGainShadeGradient = LinearGradient(
  colors: [
    Colors.green.withOpacity(0.53),
    Colors.green.withOpacity(0.01),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient kLossShadeGradient = LinearGradient(
  colors: [
    Colors.red.withOpacity(0.53),
    Colors.red.withOpacity(0.01),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient kPaidGradient = const LinearGradient(
  colors: [
    Color(0xFFDC3E88),
    Color(0xFFB840AE),
    Color(0xFF843FE8),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const RadialGradient kTrendCardGradient = RadialGradient(
  colors: [
    Color(0xFF725EB0),
    Color(0xFF6D51AA),
    Color(0xFF61349C),
  ],
);

class AppColor {
  static const neutralColor = MaterialColor(
    0xFF4B4B4B,
    {
      50: Color(0xFFEDEDED),
      100: Color(0xFFC7C7C7),
      200: Color(0xFFACACAC),
      300: Color(0xFF868686),
      400: Color(0xFFE9EBF8),
      500: Color(0xFF4B4B4B),
      600: Color(0xFF444444),
      700: Color(0xFF353535),
      800: Color(0xFF292929),
      900: Color(0xFF202020),
    },
  );

  static const kPrimaryColor = MaterialColor(
    0xFF2563EB,
    {
      50: Color(0xFFE9EBF8),
      75: Color(0XFFE9EFFD),
      100: Color(0xFFBBCFF9),
      200: Color(0xFF9BB7F6),
      300: Color(0xFF6D96F2),
      400: Color(0xFF5182EF),
      500: Color(0xFF2563EB),
      600: Color(0xFF225AD6),
      700: Color(0xFF1A46A7),
      800: Color(0xFF143681),
      900: Color(0xFF102A63),
    },
  );

  static const kSuccessColor = MaterialColor(
    0xFF149443,
    {
      50: Color(0xFFE8F4EC),
      100: Color(0xFFB6DEC5),
      200: Color(0xFF93CEA9),
      300: Color(0xFF62B781),
      400: Color(0xFF43A969),
      500: Color(0xFF149443),
      600: Color(0xFF12873D),
      700: Color(0xFF0E6930),
      800: Color(0xFF0B5125),
      900: Color(0xFF083E1C),
    },
  );

  static const kWarningColor = MaterialColor(
    0xFFE3AF4A,
    {
      50: Color(0xFFFCF7ED),
      100: Color(0xFFF6E6C7),
      200: Color(0xFFF2DAAC),
      300: Color(0xFFECC986),
      400: Color(0xFFE9BF6E),
      500: Color(0xFFE3AF4A),
      600: Color(0xFFCF9F43),
      700: Color(0xFFA17C35),
      800: Color(0xFF7D6029),
      900: Color(0xFF5F4A1F),
    },
  );

  static const kErrorColor = MaterialColor(
    0xFFBA0000,
    {
      50: Color(0xFFF8E6E6),
      100: Color(0xFFEAB0B0),
      200: Color(0xFFDF8A8A),
      300: Color(0xFFD15454),
      400: Color(0xFFC83333),
      500: Color(0xFFBA0000),
      600: Color(0xFFA90000),
      700: Color(0xFF840000),
      800: Color(0xFF660000),
      900: Color(0xFF4E0000),
    },
  );
}
