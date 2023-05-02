import 'package:flutter/material.dart';

class ScreenSizes {
  static const double xs = 480.0;
  static const double sm = 640.0;
  static const double md = 768.0;
  static const double lg = 1024.0;
  static const double xl = 1280.0;
  static const double xxl = 1536.0;
}

Axis getAxis(double width) =>
    width > ScreenSizes.md ? Axis.horizontal : Axis.vertical;


extension ChangeAxisBasedOnWidth on double {
  Axis getAxis() => this > ScreenSizes.md ? Axis.horizontal : Axis.vertical;
}