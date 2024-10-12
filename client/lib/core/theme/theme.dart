import 'package:client/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.apply(fontFamily: "CustomFont"),
      scaffoldBackgroundColor: Pallet.backgroundColor,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ));
}
