import 'package:flutter/material.dart';

const color60 = Color(0XFFC2C2C2);
const color30 = Color(0XFF2C2C2C);
const color10 = Color(0XFF7ACC96);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: const Color(0XFF7ACC96),
  brightness: Brightness.light,
);
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: const Color(0XFF7ACC96),
  brightness: Brightness.dark,
);
