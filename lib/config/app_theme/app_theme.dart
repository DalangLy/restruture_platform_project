import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  static AppTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }

  const AppTheme({Key? key, required Widget child,}) : super(key: key, child: child);

  Color get scaffoldDarkBackground => Colors.white;//test
  Color get scaffoldLightBackground => Colors.white;//test

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //textTheme: GoogleFonts.robotoTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
    ),
    //scaffoldBackgroundColor: Color(0xFFD2E8F1),
    scaffoldBackgroundColor: Colors.white,
  );

  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //textTheme: GoogleFonts.robotoTextTheme(),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
    ),
  );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
