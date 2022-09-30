import 'package:flutter/material.dart';

class Themes {
  final theme = ThemeData.light().copyWith(
    backgroundColor: const Color(0xFFFFFFFF),
    highlightColor: const Color.fromARGB(255, 123, 128, 184),
    errorColor: const Color(0xFFD80031),
    primaryColorLight: const Color(0xFFFCFBFB),
    primaryColorDark: const Color.fromARGB(255, 0, 0, 0),
    selectedRowColor: const Color(0xFFFFC300),
    listTileTheme: const ListTileThemeData(
        selectedColor: Color(0xFFFCFBFB), tileColor: Color(0xFFE1E3E6)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue[800],
      backgroundColor: const Color(0xFFFFFFFF),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      bodyText2: TextStyle(fontSize: 16, color: Colors.black),
      caption: TextStyle(fontSize: 16, color: Color(0xFF434343)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFFFCFBFB),
      contentPadding: const EdgeInsets.all(8),
      hintStyle: TextStyle(
          fontSize: 16,
          color: const Color(0xFF434343).withOpacity(0.55),
          fontWeight: FontWeight.w500),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(
          width: 2,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFE6E4E4),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return const Color.fromARGB(255, 0, 0, 0);
          },
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Color(0xFFF7F8FA),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.56,
        color: Color(0xFFF4F4F4),
      ),
    ),
  );
}
