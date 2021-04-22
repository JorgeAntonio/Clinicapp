import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static Widget create(BuildContext context) => SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: myWhiteColor));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_outlined,
              size: isMobile(context) ? 45 : 64,
              color: mySecondaryColor,
            ),
            Text('Clinicapp',
                style: TextStyle(
                    fontSize: isMobile(context) ? 45 : 64,
                    fontWeight: FontWeight.bold,
                    color: myPrimaryColor)),
            CircularProgressIndicator(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
