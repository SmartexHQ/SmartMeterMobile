import 'package:flutter/material.dart';

// const Color kcDarkTextColor = Color(0xff121111);
const Color kcPrimaryColor = Color(0xff1570EF);
const Color kcSecondaryColor = Color(0xFFF2F4F7);

const Color kcPrimaryColor50 = Color(0xffFFF4ED);

const Color kcTextColor = Color(0xFF111213);
const Color kcSoftTextColor = Color(0xFF4F5E62);

const Color kcGreyLight = Color(0xffEEEEEE);
const Color kcGrey800 = Color(0xff424242);
const Color kcGrey600 = Color(0xff757575);
const Color kcGrey500 = Color(0xff667185);
const Color kcGrey400 = Color(0xffBDBDBD);
const Color kcGrey200 = Color(0xffEEEEEE);
const Color kcGrey100 = Color(0xffF5F5F5);

// Neutral
const Color kcTextNeutral900 = Color(0xff0A0A0A);
const Color kcTextNeutral800 = Color(0xff171717);
const Color kcTextNeutral700 = Color(0xff262626);
const Color kcTextNeutral600 = Color(0xff404040);
const Color kcTextNeutral500 = Color(0xff525252);
const Color kcTextNeutral400 = Color(0xff737373);
const Color kcTextNeutral300 = Color(0xffA3A3A3);
const Color kcTextNeutral200 = Color(0xffD4D4D4);
const Color kcTextNeutral100 = Color(0xffE5E5E5);

// Primary color
const Color kcPrimaryColor900 = Color(0xff1D3F40);
const Color kcPrimaryColor800 = Color(0xff1F4A40);
const Color kcPrimaryColor700 = Color(0xff246D5C);
const Color kcPrimaryColor600 = Color(0xff198A6F);
const Color kcPrimaryColor500 = Color(0xff12A380);
const Color kcPrimaryColor400 = Color(0xff33C9A5);
const Color kcPrimaryColor300 = Color(0xff5AE1C1);
const Color kcPrimaryColor200 = Color(0xff8FF4DC);
const Color kcPrimaryColor100 = Color(0xffCEFFF3);

const Color kcWhite = Color(0xFFFFFFFF);
const Color kcBackground = Color.fromARGB(255, 255, 255, 255);
const Color kcDarkBackground = Color(0xFF121212);

const Color kcSuccessColor = Color(0xFF11A27F);
const Color kcErrorColor = Color(0xFFF0544F);

final Color kcDividerDark = const Color(0xff8C9A9E).withOpacity(0.2);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffffffff), // kcBackground,
    primaryColor: kcPrimaryColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: kcGrey400,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kcPrimaryColor,
    ),
    colorScheme: const ColorScheme.light(primary: kcPrimaryColor)
        .copyWith(error: kcErrorColor),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff0C0C0C),
    primaryColor: kcPrimaryColor,
    textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),

    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: Colors.white,
    // ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kcGrey600,
      selectionColor: kcGrey600,
      selectionHandleColor: kcGrey600,
    ),
    colorScheme: const ColorScheme.dark(primary: kcPrimaryColor)
        .copyWith(error: kcErrorColor),
  );
}

// Them Checker
extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
