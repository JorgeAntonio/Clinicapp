import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static Widget create(BuildContext context) => SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 24),
            Text('Loading', style: TextStyle(fontSize: 24))
          ],
        ),
      ),
    );
  }
}
