import 'package:flutter/material.dart';

abstract class AppColor {
  Color get backgroundColor;
  Color get systemAppColor;
  Color get primaryColor;
  Color get secondaryColor;
  Color get textColor;
  Color get passiveTextColor;
}

class LightColor extends AppColor {
  @override
  Color get backgroundColor => const Color(0xffffffff);

  @override
  Color get passiveTextColor => const Color(0xffA6A6A6);

  @override
  Color get primaryColor => const Color(0xff2944f6);

  @override
  Color get secondaryColor => const Color(0xfff2f6f7);

  @override
  Color get systemAppColor => throw UnimplementedError();

  @override
  Color get textColor => const Color(0xff1a1b25);
}

class DarkColor extends AppColor {
  @override
  Color get backgroundColor => const Color(0xff26272c);

  @override
  Color get passiveTextColor => const Color(0xffA6A6A6);

  @override
  Color get primaryColor => const Color(0xffc1daff);

  @override
  Color get secondaryColor => const Color(0xff3e4048);

  @override
  Color get systemAppColor => throw UnimplementedError();

  @override
  Color get textColor => const Color(0xffe2e1ef);
}

class AppTheme {
  static Color greyColor = const Color(0xff757988);
  static Color primaryColor = const Color(0xff2944f6);
  static ThemeData lightTheme() {
    final appColor = LightColor();
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light, seedColor: LightColor().primaryColor),
      brightness: Brightness.light,
      disabledColor: const Color(0xffe9ecf1),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: appColor.textColor),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: appColor.textColor),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: appColor.textColor),
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: appColor.textColor),
        bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: appColor.textColor),
        bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: appColor.textColor),
        labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: appColor.textColor),
        labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: appColor.textColor),
        labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: appColor.textColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: appColor.secondaryColor,
          selectedItemColor: appColor.primaryColor,
          unselectedItemColor: greyColor),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: appColor.primaryColor, width: 1),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              )),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
    );
  }

  static ThemeData darkTheme() {
    final appColor = DarkColor();
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: primaryColor,
      disabledColor: const Color(0xff1b1f2f),
      colorScheme: ColorScheme.fromSeed(
        seedColor: appColor.primaryColor,
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          backgroundColor: appColor.backgroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: appColor.textColor,
          unselectedItemColor: greyColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: appColor.textColor),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: appColor.textColor),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: appColor.textColor),
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: appColor.textColor),
        bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: appColor.textColor),
        bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: appColor.textColor),
        labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: appColor.textColor),
        labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: appColor.textColor),
        labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: appColor.textColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white, width: 1),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              )),
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: appColor.textColor)),
    );
  }
}
