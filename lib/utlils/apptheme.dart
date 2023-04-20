import 'package:flutter/material.dart';

class AppTheme{
  //
  // static ThemeData lighttheme = ThemeData(
  //    appBarTheme: const AppBarTheme(
  //       backgroundColor: Colors.white,
  //       foregroundColor: Colors.black,
  //    ),
  //    textTheme: TextTheme(
  //       displayMedium: TextStyle(
  //          color: Colors.red,
  //          fontSize: 20
  //       ),
  //    ),
  //    colorScheme: const ColorScheme.light(
  //       brightness: Brightness.light,
  //       primary: Colors.white,
  //       secondary: Colors.lightBlueAccent,
  //    )
  // );
  // static ThemeData darktheme = ThemeData(
  //     textTheme: TextTheme(
  //        displayMedium: TextStyle(
  //            color: Colors.red,
  //            fontSize: 20
  //        ),
  //     ),
  //     appBarTheme: const AppBarTheme(
  //        backgroundColor: Colors.black,
  //        foregroundColor: Colors.white,
  //     ),
  //     colorScheme: const ColorScheme.dark(
  //       brightness: Brightness.dark,
  //       primary: Colors.black,
  //       secondary: Colors.lightBlueAccent,
  //    )
  // );
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      // primary: Colors.green,
      inversePrimary: Colors.blue,
      // primaryContainer: Colors.purple,
      errorContainer: Colors.red,
    ),

  );

  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}