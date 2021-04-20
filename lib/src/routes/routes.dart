import 'package:flutter/material.dart';

//PAGES

import 'package:app_clinica/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:app_clinica/src/features/presentation/login_page/view/login_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/tabs_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/specialities_tabs/view/specialities_page.dart';
import 'package:app_clinica/src/features/presentation/singIn_page/view/singIn_page.dart';
import 'package:app_clinica/src/features/presentation/splash_screen/splash_screen.dart';
import 'package:app_clinica/src/features/presentation/intro_page/intro_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'tabs': (BuildContext context) => TabsPage(),
  'doctors': (BuildContext context) => DoctorsPage(),
  'singin': (BuildContext context) => SingInPage(),
  'splashscreen': (BuildContext context) => SplashScreen(),
  'introduction': (BuildContext context) => IntroPage()
};

class Routes {
  static const splash = "/";
  static const intro = "/introduction";
  static const tabs = "/tabs";

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _builtRoute(SplashScreen.create);
      case intro:
        return _builtRoute(IntroPage.create);
      case tabs:
        return _builtRoute(TabsPage.create);
      default:
        throw Exception('Route does not exist');
    }
  }

  static MaterialPageRoute _builtRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
