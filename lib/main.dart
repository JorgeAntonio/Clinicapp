import 'package:flutter/material.dart';
//FIREBASE
import 'package:firebase_core/firebase_core.dart';
//ROUTES
import 'package:app_clinica/src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'introduction',
      title: 'ClinicApp',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          //textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
    );
  }
}
