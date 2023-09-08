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
const kPrimaryColor = Color(0xff042B59);
const kSecondaryColor = Color(0xff3497FD);
const kBackgroundColor = Color(0xffFAFAFE);
const kCardColor = Color(0xffFAFAFE);
const kTextColor = Color(0xff042B59);
const kTextColorLight = Color(0xffFAFAFE);
const kLightTextColor = Color(0xffFAFAFE);
const kCardBorderRadius = 10.0;
const kButtonBorderRadius = 10.0;

const kErrorColor = Color(0xFFCB3333);
const kWarnColor = Color(0xFFFFCC00);

const kInputBorderSize = 1.0;

///
/// The app's UI theme
///
class UiTheme {
  // Light Theme
  get lightTheme {}
  // Dark Theme
  get darkTheme {
    final baseDarkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: kFontFamily,
      primaryColor: kPrimaryColor,
      cardColor: kCardColor,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: kPrimaryColor,
      ),
      visualDensity: VisualDensity.standard,
      scaffoldBackgroundColor: kSecondaryColor,
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
    final darkBodyMedium = getDarkBodyMedium(baseDarkTheme);
    final darkLabelMedium = getDarkLabelMedium(baseDarkTheme);

    // overrides
    return baseDarkTheme.copyWith(
      splashFactory: UiPlatform.isWeb || UiPlatform.isIOS
          ? NoSplash.splashFactory
          : baseDarkTheme.elevatedButtonTheme.style?.splashFactory,
      textTheme: baseDarkTheme.textTheme.copyWith(
        labelSmall: baseDarkTheme.textTheme.labelSmall?.copyWith(
          fontFamily: 'AxiaLight',
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        labelMedium: darkLabelMedium,
        labelLarge: baseDarkTheme.textTheme.labelLarge?.copyWith(
          fontFamily: 'AxiaLight',
          fontSize: 22,
          letterSpacing: 1.25,
          color: kTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodySmall: baseDarkTheme.textTheme.bodySmall?.copyWith(
          fontFamily: 'Axia',
          height: 1.25,
          fontSize: 16,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyMedium: baseDarkTheme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'Axia',
          fontSize: 18,
          letterSpacing: 1.83,
          color: kTextColor,
          fontWeight: FontWeight.w400,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyLarge: baseDarkTheme.textTheme.bodyLarge?.copyWith(
          fontFamily: 'Axia',
          fontSize: 22,
          letterSpacing: 2.08,
          color: kTextColor,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineSmall: baseDarkTheme.textTheme.headlineSmall?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineMedium: baseDarkTheme.textTheme.headlineMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineLarge: darkHeadlineLarge,
        titleSmall: baseDarkTheme.textTheme.titleSmall?.copyWith(
          fontFamily: 'AxiaBlack',
          fontWeight: FontWeight.w400,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleMedium: baseDarkTheme.textTheme.titleMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          fontWeight: FontWeight.w400,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleLarge: baseDarkTheme.textTheme.titleLarge?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 36,
          letterSpacing: 2.38,
          color: kTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displaySmall: baseDarkTheme.textTheme.displaySmall?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          color: kTextColor,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayMedium: baseDarkTheme.textTheme.displayMedium?.copyWith(
          fontFamily: 'AxiaBlack',
          fontSize: 42,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          color: kTextColor,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayLarge: baseDarkTheme.textTheme.displayLarge?.copyWith(
          fontFamily: 'AxiaBlack',
          fontWeight: FontWeight.w400,
          height: 1.0,
          color: kPrimaryColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          enableFeedback: true,
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kButtonBorderRadius)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kCardColor),
          surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white38;
              return kPrimaryColor;
            },
          ),
          textStyle: MaterialStateProperty.all(darkLabelMedium),
          shadowColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     textStyle: MaterialStateProperty.all(darkHeadlineLarge?.copyWith(fontSize: 20)),
      //     padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 24)),
      //     maximumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
      //     foregroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //         if (states.contains(MaterialState.disabled)) return Colors.white38;
      //         return kSecondaryColor;
      //       },
      //     ),
      //   ),
      // ),
      cardTheme: CardTheme(
        elevation: 2,
        shadowColor: Colors.black87,
        color: kCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
        ),
      ),
      inputDecorationTheme: baseDarkTheme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: kCardColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
        hintStyle: baseDarkTheme.textTheme.bodySmall?.copyWith(color: kPrimaryColor.withOpacity(0.5)),
        labelStyle: baseDarkTheme.textTheme.bodySmall?.copyWith(color: kTextColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kCardColor, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: kCardColor, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: kInputBorderSize),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusColor: kPrimaryColor,
      ),
    );
  }

  TextStyle? getDarkHeadlineLarge(ThemeData baseDarkTheme) {
    return baseDarkTheme.textTheme.headlineLarge?.copyWith(
      fontFamily: 'AxiaBlack',
      fontSize: 32,
      letterSpacing: 2.08,
      color: kPrimaryColor,
      fontWeight: FontWeight.w800,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }

  TextStyle? getDarkBodyMedium(ThemeData baseDarkTheme) {
    return baseDarkTheme.textTheme.bodyMedium?.copyWith(
      fontFamily: 'Axia',
      fontSize: 20,
      letterSpacing: 1.83,
      color: kTextColor,
      fontWeight: FontWeight.w500,
      height: 1.5,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }

  TextStyle? getDarkLabelMedium(ThemeData baseDarkTheme) {
    return baseDarkTheme.textTheme.labelMedium?.copyWith(
      fontFamily: 'AxiaLight',
      fontSize: 15,
      letterSpacing: 1.25,
      color: kPrimaryColor,
      fontWeight: FontWeight.w400,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }
}
