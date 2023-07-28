import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: const IconThemeData(color: Colors.white, size: 35),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontFamily: 'Jannah',
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: HexColor('333739'),
      elevation: 0.0),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    elevation: 20.0,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey[400],
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: IconThemeData(color: Colors.black, size: 35),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);
