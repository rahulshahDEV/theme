import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    // brightness: Brightness.light,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.deepPurple),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true);

ThemeData DarkMode = ThemeData(
  // brightness: Brightness.dark,
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.grey),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
  ),
);
