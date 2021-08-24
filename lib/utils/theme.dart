import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

ThemeData theme = ThemeData(
  fontFamily: "Ubuntu",
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: kTextColor,
    ),
    bodyText2: TextStyle(
      color: kTextColor,
      fontSize: 14.0,
    ),
    headline1: TextStyle(
      color: kTextColor,
      fontSize: 28.0,
    ),
    headline6: TextStyle(
      color: kTextColor,
    ),
    headline2: TextStyle(
      color: kBackgroundColor,
      fontSize: 17.0,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      color: kBackgroundColor,
      fontSize: 15.0,
    ),
    headline4: TextStyle(
      color: kLightenPrimaryColor,
      fontSize: 13.0,
    ),
  ),
  splashColor: kLightenPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  buttonColor: kPrimaryColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      backgroundColor: kPrimaryColor,
      primary: Color(0xff1C1F2E),
      minimumSize: Size(double.infinity, 50.0),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kLightenBackgroundColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: kTextColor,
    ),
    filled: true,
    fillColor: kLightenBackgroundColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    ),
  ),
);
