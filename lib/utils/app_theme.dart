import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(backgroundColor: AppColor.bgLightColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.mainLightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.bgLightColor,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      unselectedLabelStyle: AppStyles.med16Black,
      labelStyle: AppStyles.med16White,
    ),
    scaffoldBackgroundColor: AppColor.bgLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.bgLightColor,
      selectedItemColor: AppColor.mainLightColor,
      unselectedItemColor: AppColor.disableColor,
      selectedLabelStyle: AppStyles.reg12Main,
      unselectedLabelStyle: AppStyles.reg12grey,
    ),
    cardColor: AppColor.mainLightColor,
    dividerColor: AppColor.whiteColor,
    canvasColor: AppColor.disableColor,
    focusColor: AppColor.mainLightColor,
    colorSchemeSeed: AppColor.mainLightColor,
    textTheme: TextTheme(
      titleSmall: AppStyles.semi20Black,
      titleMedium: AppStyles.med18Main,
      titleLarge: AppStyles.semi16Main,
      headlineSmall: AppStyles.med14Black,
      headlineMedium: AppStyles.med16Black,
      headlineLarge: AppStyles.med20Black,
      bodySmall: AppStyles.semi24Main,
      bodyMedium: AppStyles.semi14Main,
      bodyLarge: AppStyles.med16Main,
      labelSmall: AppStyles.med18Black,
      labelMedium: AppStyles.med16Main,
      // labelLarge: ,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.bgDarkColor,
    ),
    appBarTheme: AppBarThemeData(backgroundColor: AppColor.bgDarkColor),
    tabBarTheme: TabBarThemeData(
      indicatorColor: Colors.transparent,
      dividerColor: AppColor.inputDarkColor,
      unselectedLabelStyle: AppStyles.med16White,
      labelStyle: AppStyles.med16White,
    ),
    scaffoldBackgroundColor: AppColor.bgDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.inputDarkColor,
      selectedItemColor: AppColor.mainDarkColor,
      unselectedItemColor: AppColor.disableColor,
      selectedLabelStyle: AppStyles.reg12MainDark,
      unselectedLabelStyle: AppStyles.reg12grey,
    ),
    cardColor: AppColor.mainDarkColor,
    focusColor: AppColor.whiteColor,
    dividerColor: AppColor.inputDarkColor,
    canvasColor: AppColor.mainDarkColor,
    colorSchemeSeed: AppColor.mainDarkColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.mainDarkColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    textTheme: TextTheme(
      titleSmall: AppStyles.semi20White,
      titleMedium: AppStyles.med18MainDark,
      titleLarge: AppStyles.semi16MainDark,
      headlineSmall: AppStyles.med14White,
      headlineMedium: AppStyles.med16White,
      headlineLarge: AppStyles.med20White,
      bodySmall: AppStyles.semi24White,
      bodyMedium: AppStyles.semi14MainDark,
      bodyLarge: AppStyles.med16MainDark,
      labelSmall: AppStyles.med18White,
      labelMedium: AppStyles.med16White,
      // labelLarge: ,
    ),
  );
}
