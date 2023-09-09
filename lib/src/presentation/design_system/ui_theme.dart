import 'dart:ui';

import 'package:flutter/material.dart';
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
const kFontFamily = 'Roboto';
const kPrimaryColor = Color(0xff042B59);
const kSecondaryColor = Color(0xff3497FD);
const kBackgroundColor = Color(0xffFAFAFE);
const kCardColor = Color(0xffFAFAFE);
const kTextColor = Color(0xff042B59);
const kTextColorLight = Color(0xffFAFAFE);
const kCardBorderRadius = 10.0;
const kButtonBorderRadius = 10.0;

/// UI Colors Lighttheme

/// UI Colors Darktheme

const kErrorColor = Color(0xffCB3333);
const kWarnColor = Color(0xffFFCC00);

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
      scaffoldBackgroundColor: kBackgroundColor,
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
          fontFamily: 'RobotoLight',
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        labelMedium: darkLabelMedium,
        labelLarge: baseDarkTheme.textTheme.labelLarge?.copyWith(
          fontFamily: 'RobotoLight',
          fontSize: 22,
          letterSpacing: 1.25,
          color: kTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodySmall: baseDarkTheme.textTheme.bodySmall?.copyWith(
          fontFamily: 'Roboto',
          height: 1.25,
          fontSize: 16,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        bodyMedium: darkBodyMedium,
        bodyLarge: baseDarkTheme.textTheme.bodyLarge?.copyWith(
          fontFamily: 'Roboto',
          fontSize: 22,
          letterSpacing: 2.08,
          color: kTextColor,
          height: 1.5,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineSmall: baseDarkTheme.textTheme.headlineSmall?.copyWith(
          fontFamily: 'RobotoBlack',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineMedium: baseDarkTheme.textTheme.headlineMedium?.copyWith(
          fontFamily: 'RobotoBlack',
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.83,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        headlineLarge: darkHeadlineLarge,
        titleSmall: baseDarkTheme.textTheme.titleSmall?.copyWith(
          fontFamily: 'RobotoBlack',
          fontWeight: FontWeight.w400,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleMedium: baseDarkTheme.textTheme.titleMedium?.copyWith(
          fontFamily: 'RobotoBlack',
          fontWeight: FontWeight.w400,
          color: kTextColor,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        titleLarge: baseDarkTheme.textTheme.titleLarge?.copyWith(
          fontFamily: 'RobotoBlack',
          fontSize: 36,
          letterSpacing: 2.38,
          color: kTextColor,
          fontWeight: FontWeight.w400,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displaySmall: baseDarkTheme.textTheme.displaySmall?.copyWith(
          fontFamily: 'RobotoBlack',
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          color: kTextColor,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayMedium: baseDarkTheme.textTheme.displayMedium?.copyWith(
          fontFamily: 'RobotoBlack',
          fontSize: 42,
          fontWeight: FontWeight.w400,
          letterSpacing: 3.5,
          color: kTextColor,
          height: 1.0,
          fontFeatures: [const FontFeature.liningFigures()],
        ),
        displayLarge: baseDarkTheme.textTheme.displayLarge?.copyWith(
          fontFamily: 'RobotoBlack',
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
      fontFamily: 'RobotoBlack',
      fontSize: 32,
      letterSpacing: 2.08,
      color: kPrimaryColor,
      fontWeight: FontWeight.w800,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }

  TextStyle? getDarkBodyMedium(ThemeData baseDarkTheme) {
    return baseDarkTheme.textTheme.bodyMedium?.copyWith(
      fontFamily: 'Roboto',
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
      fontFamily: 'RobotoLight',
      fontSize: 15,
      letterSpacing: 1.25,
      color: kPrimaryColor,
      fontWeight: FontWeight.w400,
      fontFeatures: [const FontFeature.liningFigures()],
    );
  }
}
