import 'package:flutter/material.dart';

abstract class AppColor {
  static const primary = Color(0xFF1FC069);
  static const primaryDark = Color(0xFF158248);
  static const canvas = Color(0xFFFFFFFF);
  static const background = Color(0xFFF6F6F6);
  static const borderColor = Colors.black12;
  static const lightBorderColor = Color(0xFFCDD5D8);
  static const subHintColor = Colors.black45;

  static const black = Colors.black;
  static const white = Colors.white;
  static const grey = Colors.grey;
  static const red = Colors.red;
}

final appTheme = ThemeData(
  primaryColor: AppColor.primary,
  canvasColor: AppColor.canvas,
  fontFamily: "PlusJakarta",
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.primary,
    onPrimary: Colors.white,
    secondary: AppColor.primary,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surfaceTint: AppColor.background,
    surface: AppColor.canvas,
    onSurface: Colors.black,
  ),
  inputDecorationTheme: inputDecoration(false),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 28, color: Colors.black),
    titleMedium: TextStyle(fontSize: 24, color: Colors.black),
    titleSmall: TextStyle(fontSize: 20, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    bodySmall: TextStyle(fontSize: 12, color: Colors.black),
  ),
);

InputDecorationTheme inputDecoration(bool darkMode) {
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[50],
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.borderColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.borderColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColor.red.withValues(alpha: 0.8),
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.red, width: 1.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.primary, width: 1),
    ),
    labelStyle: TextStyle(color: darkMode ? AppColor.white : AppColor.black),
    hintStyle: const TextStyle(
      color: AppColor.subHintColor,
      fontSize: 14,
      height: 2.5,
    ),
  );
}
