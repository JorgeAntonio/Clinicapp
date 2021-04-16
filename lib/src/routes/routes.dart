import 'package:flutter/material.dart';

//PAGES
import 'package:app_clinica/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:app_clinica/src/features/presentation/login_page/view/login_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/tabs_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/specialities_tabs/view/specialities_page.dart';
import 'package:app_clinica/src/features/presentation/singIn_page/view/singIn_page.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'tabs': (BuildContext context) => TabsPage(),
  'doctors': (BuildContext context) => DoctorsPage(),
  'singin': (BuildContext context) => SingInPage(),
};
