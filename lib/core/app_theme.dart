import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF3F6900),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFB4F666),
      onPrimaryContainer: Color(0xFF102000),
      secondary: Color(0xFF586249),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFDBE7C8),
      onSecondaryContainer: Color(0xFF151E0B),
      tertiary: Color(0xFF386663),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFBBECE8),
      onTertiaryContainer: Color(0xFF00201E),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFDFCF5),
      onBackground: Color(0xFF1B1C18),
      outline: Color(0xFF75796C),
      onInverseSurface: Color(0xFFF2F1E9),
      inverseSurface: Color(0xFF30312C),
      inversePrimary: Color(0xFF99D94D),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF3F6900),
      outlineVariant: Color(0xFFC5C8BA),
      scrim: Color(0xFF000000),
      surface: Color(0xFFFAFAF2),
      onSurface: Color(0xFF1B1C18),
      surfaceVariant: Color(0xFFE1E4D5),
      onSurfaceVariant: Color(0xFF44483D),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFA6A3A0)),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(fontSize: 15, color: Colors.grey),
        titleLarge: TextStyle(fontSize: 12)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
