import 'package:fitness_tracker/core/theme/app_pallete.dart';
import 'package:fitness_tracker/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppPallete.primaryColor,
    scaffoldBackgroundColor: AppPallete.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.primaryColor,
      primary: AppPallete.primaryColor,
      secondary: AppPallete.secondaryColor,
      surface: AppPallete.white,
      error: AppPallete.errorColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.white,
      foregroundColor: AppPallete.black,
      iconTheme: IconThemeData(color: AppPallete.black),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppPallete.white,
      selectedItemColor: AppPallete.primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPallete.white,
      contentPadding: const EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: AppPallete.primaryColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: AppPallete.primaryColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: AppPallete.errorColor, width: 1.0),
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppPallete.backgroundColor,
      selectedColor: AppPallete.primaryColor,
      secondarySelectedColor: AppPallete.secondaryColor,
      labelStyle: TextStyle(color: AppPallete.black),
      secondaryLabelStyle: TextStyle(color: Colors.white70),
      padding: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primaryColor,
        foregroundColor: AppPallete.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppPallete.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      indicatorColor: AppPallete.primaryColor,
      labelTextStyle: MaterialStateProperty.all(
        AppTextStyle.labelMedium.copyWith(color: AppPallete.white),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      contentPadding: const EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: AppPallete.primaryColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: AppPallete.primaryColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.primaryColor,
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent,
      surface: Colors.black,
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),

    //Central Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
    ),

    //Central Chip Theme
    chipTheme: ChipThemeData(
      // backgroundColor: AppPallete.backgroundColor,
      selectedColor: AppPallete.primaryColor,
      secondarySelectedColor: AppPallete.secondaryColor,
      labelStyle: AppTextStyle.labelMedium.copyWith(color: AppPallete.white),
      secondaryLabelStyle: TextStyle(color: Colors.white70),
      padding: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primaryColor,
        foregroundColor: AppPallete.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),
  );
}
