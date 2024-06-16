import 'package:flutter/material.dart';

const Color _primaryColor = Color(0xff634133);

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: _primaryColor,
    onPrimary: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: _primaryColor,
    iconTheme: IconThemeData(color: _primaryColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
          Colors.green),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(
          _primaryColor),
    ),
  ),
  iconTheme: const IconThemeData(color: _primaryColor),
);

// Dark theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: _primaryColor,
    onPrimary: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: _primaryColor,
    iconTheme: IconThemeData(color: _primaryColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
          Colors.green),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(
          _primaryColor),
    ),
  ),
  iconTheme: const IconThemeData(color: _primaryColor),
);
