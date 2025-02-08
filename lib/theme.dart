import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

// Theme data
ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      // Consistent AppBar styling
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: kContentColorLightTheme,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
      background: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.black, // تعيين لون الخلفية إلى الأسود
    appBarTheme: const AppBarTheme(
      // Consistent AppBar styling
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: Colors.white), // تعديل لون الأيقونات
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: Colors.white, // تعديل لون النص
    ),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
      background: Colors.black, // تعيين لون الخلفية إلى الأسود
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black, // تعيين لون الخلفية إلى الأسود
      selectedItemColor: Colors.white70,
      unselectedItemColor: Colors.white70.withOpacity(0.5),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

// ThemeProvider
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
