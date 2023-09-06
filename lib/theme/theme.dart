import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeMode currentTheme() {
    return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  ButtonStyle outlinedButtonStyleLight = ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        return const TextStyle(
          color: Colors.black, // Metin rengi
          // Diğer metin stil ayarlarını ekleyin
        );
      },
    ),
    iconColor: MaterialStateProperty.all(Colors.black),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.amberAccent.shade700;
        } else {
          return Colors.transparent;
        }
      },
    ),
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.red.withOpacity(0.2);
        } else {
          return Colors.transparent;
        }
      },
    ),
    // Diğer stil ayarlarını ekleyin
  );

  ButtonStyle outlinedButtonStyleDark = ButtonStyle(
    iconColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      const TextStyle(color: Colors.white),
    ),
    // textStyle: MaterialStateProperty.resolveWith<TextStyle>(
    //       (Set<MaterialState> states) {
    //     return const TextStyle(
    //       color: Colors.white, // Metin rengi
    //       // Diğer metin stil ayarlarını ekleyin
    //     );
    //   },
    // ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.amberAccent.shade700;
        } else {
          return Colors.transparent;
        }
      },
    ),
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.deepPurple.withOpacity(0.2);
        } else {
          return Colors.transparent;
        }
      },
    ),
    // Diğer stil ayarlarını ekleyin
  );

  ThemeData getLightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        // Diğer stilleri değiştirmeye devam edin
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        headline2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        bodyText1: TextStyle(fontSize: 16, color: Colors.black),
        bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyleLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
      // Diğer özellikleri de güncelleyebilirsiniz
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        // Diğer stilleri değiştirmeye devam edin
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        bodyText2: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyleDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigoAccent,
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
      // Diğer özellikleri de güncelleyebilirsiniz
    );
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
