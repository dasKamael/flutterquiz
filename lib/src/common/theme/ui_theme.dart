import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterquiz/src/common/utils/ui_plattform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ui_theme.g.dart';

///
/// Providers
///
@Riverpod(keepAlive: true)
UiTheme uiTheme(UiThemeRef ref) {
  return UiTheme();
}

/// UI Constants
const kFontFamily = 'Axia';
const kPrimaryColor = Color(0xff132E5C);
const kSecondaryColor = Color(0xff5EBB9C);
const kLightBackground = Color(0xffF9F8F7);
const kLightCardColor = Color(0xffffffff);
const kCardDeleteColor = Color(0xffFF2553);
const kLightTextColor = Color(0xffF9F8F7);
const kDarkPrimaryColor = Color(0xff97959f);
const kDarkBackground = Color(0xff3E3E3E);
const kDarkCardColor = Color(0xff1E1E20);
const kDarkTextColor = Color(0xffC2C2C2);
const kCardBorderRadius = 14.0;
const kButtonBorderRadius = 25.0;

const kScaleColorRed = Color(0xFFFF2553);
const kScaleColorOrange = Color(0xFFFF6C18);
const kScaleColorYellow = Color(0xFFFFCC00);
const kScaleColorGreen = Color(0xFF1ED640);

const kInputBorderSize = 1.0;

///
/// The app's UI theme
///
class UiTheme {
  // Light Theme
  get lightTheme {
    final baseLightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: kFontFamily,
      primaryColor: kPrimaryColor,
      cardColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: kPrimaryColor,
      ),
      visualDensity: VisualDensity.standard,
      scaffoldBackgroundColor: kLightBackground,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Colors.white.withOpacity(0.002), // Currently only way in Flutter to SystemNavBar transparent
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white.withOpacity(0.002),
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: kPrimaryColor,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: kPrimaryColor,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
        ),
      ),
      dividerTheme: const DividerThemeData(color: Color(0xffE1E1E1), thickness: 0.5),
    );

    final lightHeadlineLarge = getLightHeadlineLarge(baseLightTheme);

    // overrides
    return baseLightTheme.copyWith(
      splashFactory: UiPlatform.isWeb || UiPlatform.isIOS
          ? NoSplash.splashFactory
          : baseLightTheme.elevatedButtonTheme.style?.splashFactory,
      textTheme: baseLightTheme.textTheme.copyWith(
        labelSmall: baseLightTheme.textTheme.labelSmall?.copyWith(
          fontFamily: 'AxiaLight',
          color: kPrimaryColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        labelMedium: baseLightTheme.textTheme.labelMedium?.copyWith(
          fontFamily: 'AxiaLight',
          color: kPrimaryColor,
          fontSize: 15,
          letterSpacing: 1.25,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        labelLarge: baseLightTheme.textTheme.labelLarge?.copyWith(
          fontFamily: 'AxiaLight',
          color: kPrimaryColor,
          fontSize: 22,
          letterSpacing: 1.25,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodySmall: baseLightTheme.textTheme.bodySmall?.copyWith(
          fontFamily: 'Axia',
          color: kPrimaryColor,
          height: 1.25,
          fontSize: 18,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyMedium: baseLightTheme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'Axia',
          color: kPrimaryColor,
          fontSize: 22,
          letterSpacing: 1.83,
          fontWeight: FontWeight.w400,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyLarge: baseLightTheme.textTheme.bodyLarge?.copyWith(
          fontFamily: 'Axia',
          color: kPrimaryColor,
          fontSize: 25,
          letterSpacing: 2.08,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineSmall: baseLightTheme.textTheme.headlineSmall?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineMedium: baseLightTheme.textTheme.headlineMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineLarge: lightHeadlineLarge,
        titleSmall: baseLightTheme.textTheme.titleSmall?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleMedium: baseLightTheme.textTheme.titleMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleLarge: baseLightTheme.textTheme.titleLarge?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 36,
          letterSpacing: 2.38,
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displaySmall: baseLightTheme.textTheme.displaySmall?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayMedium: baseLightTheme.textTheme.displayMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontSize: 42,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayLarge: baseLightTheme.textTheme.displayLarge?.copyWith(
          fontFamily: 'AxiaBlack',
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          enableFeedback: true,
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 13, horizontal: 24)),
          elevation: MaterialStateProperty.all(2),
          maximumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kButtonBorderRadius)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white38;
              return Colors.white;
            },
          ),
          textStyle: MaterialStateProperty.all(lightHeadlineLarge),
          shadowColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(lightHeadlineLarge?.copyWith(fontSize: 20)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 24)),
          maximumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
        ),
      ),
      inputDecorationTheme: baseLightTheme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(top: 11.0, bottom: 11.0, left: 24.0, right: 24.0),
        hintStyle: baseLightTheme.textTheme.bodyMedium?.copyWith(color: kDarkPrimaryColor),
        labelStyle: baseLightTheme.textTheme.headlineSmall?.copyWith(color: kDarkPrimaryColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        focusColor: kPrimaryColor,
        errorStyle: const TextStyle(color: kCardDeleteColor, fontSize: 16),
      ),
    );
  }

  TextStyle? getLightHeadlineLarge(ThemeData baseLightTheme) {
    return baseLightTheme.textTheme.headlineLarge?.copyWith(
      fontFamily: 'AxiaBlack',
      color: kPrimaryColor,
      fontSize: 25,
      letterSpacing: 2.08,
      fontWeight: FontWeight.w400,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }

  // Dark Theme
  get darkTheme {
    final baseDarkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: kFontFamily,
      primaryColor: kPrimaryColor,
      cardColor: kDarkCardColor,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: kPrimaryColor,
      ),
      visualDensity: VisualDensity.standard,
      scaffoldBackgroundColor: kDarkBackground,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          statusBarColor: Colors.white10,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: kPrimaryColor,
        surfaceTintColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
        ),
      ),
      dividerTheme: const DividerThemeData(thickness: 0.5),
    );

    final darkHeadlineLarge = getDarkHeadlineLarge(baseDarkTheme);

    // overrides
    return baseDarkTheme.copyWith(
      splashFactory: UiPlatform.isWeb || UiPlatform.isIOS
          ? NoSplash.splashFactory
          : baseDarkTheme.elevatedButtonTheme.style?.splashFactory,
      textTheme: baseDarkTheme.textTheme.copyWith(
        labelSmall: baseDarkTheme.textTheme.labelSmall?.copyWith(
          fontFamily: 'AxiaLight',
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        labelMedium: baseDarkTheme.textTheme.labelMedium?.copyWith(
          fontFamily: 'AxiaLight',
          fontSize: 15,
          letterSpacing: 1.25,
          color: kDarkTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        labelLarge: baseDarkTheme.textTheme.labelLarge?.copyWith(
          fontFamily: 'AxiaLight',
          fontSize: 22,
          letterSpacing: 1.25,
          color: kDarkTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodySmall: baseDarkTheme.textTheme.bodySmall?.copyWith(
          fontFamily: 'Axia',
          height: 1.25,
          fontSize: 18,
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyMedium: baseDarkTheme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'Axia',
          fontSize: 22,
          letterSpacing: 1.83,
          color: kDarkTextColor,
          fontWeight: FontWeight.w400,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyLarge: baseDarkTheme.textTheme.bodyLarge?.copyWith(
          fontFamily: 'Axia',
          fontSize: 25,
          letterSpacing: 2.08,
          color: kDarkTextColor,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineSmall: baseDarkTheme.textTheme.headlineSmall?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineMedium: baseDarkTheme.textTheme.headlineMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineLarge: darkHeadlineLarge,
        titleSmall: baseDarkTheme.textTheme.titleSmall?.copyWith(
          fontFamily: 'AxiaBlack',
          fontWeight: FontWeight.w400,
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleMedium: baseDarkTheme.textTheme.titleMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          fontWeight: FontWeight.w400,
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleLarge: baseDarkTheme.textTheme.titleLarge?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 36,
          letterSpacing: 2.38,
          color: kDarkTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displaySmall: baseDarkTheme.textTheme.displaySmall?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          color: kDarkTextColor,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayMedium: baseDarkTheme.textTheme.displayMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 42,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          color: kDarkTextColor,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayLarge: baseDarkTheme.textTheme.displayLarge?.copyWith(
          fontFamily: 'AxiaBlack',
          fontWeight: FontWeight.w400,
          height: 1.0,
          color: kDarkTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          enableFeedback: true,
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 13, horizontal: 24)),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kButtonBorderRadius)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kSecondaryColor),
          surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white38;
              return kDarkBackground;
            },
          ),
          textStyle: MaterialStateProperty.all(darkHeadlineLarge),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(darkHeadlineLarge?.copyWith(fontSize: 20)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 24)),
          maximumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white38;
              return kSecondaryColor;
            },
          ),
        ),
      ),
      inputDecorationTheme: baseDarkTheme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: kDarkCardColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(top: 11.0, bottom: 11.0, left: 24.0, right: 24.0),
        hintStyle: baseDarkTheme.textTheme.bodyMedium?.copyWith(color: kDarkPrimaryColor),
        labelStyle: baseDarkTheme.textTheme.headlineSmall?.copyWith(color: kDarkTextColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kDarkCardColor, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: kDarkCardColor, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
        focusColor: kPrimaryColor,
        errorStyle: const TextStyle(color: kCardDeleteColor, fontSize: 16),
      ),
    );
  }

  TextStyle? getDarkHeadlineLarge(ThemeData baseDarkTheme) {
    return baseDarkTheme.textTheme.headlineLarge?.copyWith(
      fontFamily: 'AxiaBlack',
      fontSize: 25,
      letterSpacing: 2.08,
      color: kDarkTextColor,
      fontWeight: FontWeight.w400,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }
}
