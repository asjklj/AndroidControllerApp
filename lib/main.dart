import 'package:flutter/material.dart';
import './tabs/tabs.dart';
import './route/MondayPage.dart';
import './route/TuesdayPage.dart';
import './route/WenesdayPage.dart';
import './route/ThursdayPag.dart';
import './route/FridayPage.dart';
import './route/SaterdayPage.dart';
import './route/SaterdayPage.dart';
import 'route/SundayPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: '桌上智能辅助空调控制盒app',
      // navigatorKey: getIt<NavigationService>().navigatorKey,
      // debugShowCheckedModeBanner: false,
      // // themeMode: themeMode,
      theme: ThemeData(
        fontFamily: 'Nato Sans',
        textSelectionTheme: const TextSelectionThemeData(
          // Set Up for TextFields
          cursorColor: Colors.grey,
          selectionColor: Colors.blueGrey,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF2F2F2),
          //secondary: Color(0xFFF4AE47),
          surface: Color(0xFFC4C4C4),
          background: Color(0xFFFFFFFF),
          error: Color(0xFFB00020),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFF464646),
          ),
          headline2: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF464646),
          ),
          headline3: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFF464646),
          ),
          headline4: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFFBDBDBD),
          ),
          headline5: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFFBDBDBD),
          ),
          headline6: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF464646),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      // initialRoute: "/Tab",
      routes: {
        // "/Tab": (context) => const Tabs(),
        "Monday": (context) => const MondayPage(),
        "Tuesday": (context) => const TuesdayPage(),
        "Wenesday": (context) => const WenesdayPage(),
        "Thursday": (context) => const ThursdayPage(),
        "Friday": (context) => const FridayPage(),
        "Saterday": (context) => const SaterdayPage(),
        "Sunday": (context) => const SundayPage(),
      },
      home: const Tabs(),
    );
  }
}

