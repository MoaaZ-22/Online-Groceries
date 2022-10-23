import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

// Default Theme For Application
ThemeData appLightTheme = ThemeData(
    textTheme: TextTheme(
        bodyText1: const TextStyle(fontFamily: 'GilroyRegular',fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),
        bodyText2: TextStyle(fontSize: 16,fontFamily: 'GilroySemiBold',color: defaultColor)
    ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
          fontSize: 12, fontFamily: 'GilroySemiBold',color: defaultColor,height: 1.5),
      unselectedLabelStyle: const TextStyle(height: 1.5,
          fontSize: 12, fontFamily: 'GilroySemiBold',color: Color(0xff181725)),
      selectedItemColor: defaultColor,
      unselectedItemColor: const Color(0xff181725),
      selectedIconTheme: IconThemeData(
        size: 22,
        color: defaultColor,
      ),
      unselectedIconTheme: const IconThemeData(
          color:Color(0xff181725),
          size: 25
      ),
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white
);