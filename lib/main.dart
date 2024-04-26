import 'dart:io';

import 'package:flutter/material.dart';
import 'package:techub/screens/Welcomescreen.dart';
import 'package:techub/screens/login_screen.dart';
import 'package:techub/screens/singup_screen.dart';
import 'package:techub/screens/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TecHub",
      theme: ThemeData(
          searchBarTheme: SearchBarThemeData(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(255, 248, 225, 1)))),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Login.id: (context) => Login(),
        Signup.id: (context) => Signup(),
        welcome.id: (context) => welcome(),
      },
    );
  }
}
