import 'package:app_clinica/src/features/presentation/profile_edit_page/view/profile_edit_page.dart';
import 'package:app_clinica/src/features/presentation/schedule_details_page/scheduleDetailsPage.dart';
import 'package:flutter/material.dart';
//PAGES
import 'package:app_clinica/src/features/presentation/new_schedule_page/new_schedule_page.dart';
import 'package:app_clinica/src/features/presentation/login_page/view/login_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/tabs_page.dart';
import 'package:app_clinica/src/features/presentation/singIn_page/view/singIn_page.dart';
import 'package:app_clinica/src/features/presentation/splash_screen/splash_screen.dart';
import 'package:app_clinica/src/features/presentation/intro_page/intro_page.dart';
import 'package:app_clinica/src/features/presentation/find_doctors/find_doctors.dart';

class Routes {
  static const splash = "/";
  static const intro = "/introduction";
  static const tabs = "/tabs";
  static const createAcount = "/createAcount";
  static const signInEmail = "/signInEmail";
  static const especialistDetailsPage = "/especialistDetails";
  static const doctorsProfilePage = "/doctorsProfilePage";
  static const newSchedulePage = "/newSchedulePage";
  static const findDoctorsPage = "/findDoctorsPage";
  static const scheduleDetailsPage = "/scheduleDetailsPage";
  static const profileEditPage = "/profileEditPage";

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _builtRoute(SplashScreen.create);
      case intro:
        return _builtRoute(IntroPage.create);
      case tabs:
        return _builtRoute(TabsPage.create);
      case createAcount:
        return _builtRoute(SingInPage.create);
      case signInEmail:
        return _builtRoute(LoginPage.create);
      case newSchedulePage:
        return _builtRoute(NewSchedulePage.create);
      case findDoctorsPage:
        return _builtRoute(FindDoctorsPage.create);
      case scheduleDetailsPage:
        return _builtRoute(ScheduleDetailsPage.create);
      case profileEditPage:
        return _builtRoute(ProfileEditPage.create);
      default:
        throw Exception('Route does not exist');
    }
  }

  static MaterialPageRoute _builtRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
