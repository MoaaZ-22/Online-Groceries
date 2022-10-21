import 'package:flutter/material.dart';
import 'colors.dart';

// Default Theme For Application
ThemeData appLightTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(
        fontSize: 12, fontFamily: 'GilroySemiBold', letterSpacing: 1.1,color: defaultColor),
    unselectedLabelStyle: const TextStyle(
        fontSize: 12, fontFamily: 'GilroySemiBold', letterSpacing: 1.1, color: Color(0xff181725)),
    selectedItemColor: defaultColor,
    unselectedItemColor: const Color(0xff181725),
    selectedIconTheme: IconThemeData(
      size: 22,
      color: defaultColor,
    ),
    unselectedIconTheme: const IconThemeData(
        color:Color(0xff181725),
      size: 26
    ),
    backgroundColor: Colors.white,
    elevation: 5.0,
  ),
  scaffoldBackgroundColor: Colors.white
);