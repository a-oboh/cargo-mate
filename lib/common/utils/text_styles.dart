import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle smallLight({
    Color color = Colors.black,
    double letterSpacing = 0.5,
    double fontSize = 14,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);
  }

  static TextStyle smallRegular({
    Color color = Colors.black,
    double letterSpacing = 0.5,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle mediumRegular({
    Color color = Colors.black,
    double letterSpacing = 0.5,
    double fontSize = 16,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle largeRegular({
    Color color = Colors.black,
    double letterSpacing = 0.5,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle smallSemiBold({
    Color color = Colors.black,
    double letterSpacing = 0.5,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w600, // Semi-Bold
    );
  }

  static TextStyle mediumSemiBold({
    Color color = Colors.black,
    double letterSpacing = 0.5,
    double fontSize = 16,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w600, // Semi-Bold
    );
  }

  static TextStyle largeSemiBold({
    Color color = Colors.black,
    double letterSpacing = 0.5,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.w600, // Semi-Bold
    );
  }

  static TextStyle smallBold({
    Color color = Colors.black,
    double letterSpacing = 0.5,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle mediumBold({
    Color color = Colors.black,
    double letterSpacing = 0.5,
    double fontSize = 16,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle largeBold({
    Color color = Colors.black,
    double letterSpacing = 0.5,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
    );
  }
}
