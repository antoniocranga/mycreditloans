// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';


final ThemeData customThemeData = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Gilroy',
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    primaryColor: logoColor,
    accentColor: logoColorAccent, //2.5.1 deprecated
    unselectedWidgetColor: Color(0xFF999999),
    toggleableActiveColor: logoColor,
    errorColor: redColor,
    appBarTheme: AppBarTheme(
      
      brightness: Brightness.light, //2.5.1 deprecated
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.black,
    ),
    snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: Platform.isAndroid
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
          : CircleBorder(),
    ),
  );