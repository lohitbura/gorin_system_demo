

import 'package:flutter/material.dart';
import 'package:gs_demo/resources/colors.dart';

ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColor.color12267B,
          fontWeight: FontWeight.w600,
          fontSize: 20
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColor.colorCFD3E4),
      textStyle:WidgetStateProperty.all<TextStyle>( TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18
      )),
      padding:WidgetStatePropertyAll( EdgeInsets.symmetric(vertical: 12,horizontal: 30)),
      foregroundColor: WidgetStatePropertyAll(AppColor.color12267B),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0), // Set your desired border radius here
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      border: InputBorder.none,
      hintStyle: TextStyle(
          color: AppColor.color12267B, fontSize: 16
      ),
      suffixIconColor: AppColor.color8C8C8C
  ),
  buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColor.colorCFD3E4, onPrimary: AppColor.color12267B, secondary: AppColor.colorCFD3E4, onSecondary: AppColor.color12267B, error: AppColor.colorFF0000, onError: AppColor.colorFFFFFF, surface: AppColor.colorCFD3E4, onSurface: AppColor.color12267B)
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
    surface: AppColor.colorDEE1ED,
    onSurface: AppColor.color12267B,
  ),
);