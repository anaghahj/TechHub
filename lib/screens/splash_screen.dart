import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techub/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static final id = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Login.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 208, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset(
                'assets/logo/logo.png',
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height: 20),
            SpinKitWanderingCubes(
              color: Colors.black,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
