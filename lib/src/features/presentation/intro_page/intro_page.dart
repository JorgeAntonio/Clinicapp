import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
//HOOKS
import 'package:flutter_hooks/flutter_hooks.dart';
//COLORS

class IntroPage extends StatelessWidget {
  static Widget create(BuildContext context) => IntroPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
      child: PageView(
        children: [
          _DescriptionPage(),
          _DescriptionPage(),
          _DescriptionPage(),
          WelcomePage(),
        ],
      ),
      length: 4,
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.symmetric(
                vertical: isMobile(context) ? 20 : 40, horizontal: 40),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
                  child: Column(
                    mainAxisAlignment: !isMobile(context)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: !isMobile(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: <Widget>[
                      if (isMobile(context))
                        Image.asset(
                          'images/logo.jpg',
                          height: size.height * 0.4,
                        ),
                      SizedBox(height: 10),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Clinicapp',
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 45,
                                fontWeight: FontWeight.w800,
                                color: myPrimaryColor))
                      ])),
                      SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: [
                        /*TextSpan(
                            text: 'ClinicApp',
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 32,
                                fontWeight: FontWeight.w800,
                                color: verde)),*/
                        TextSpan(
                            text: 'Sientete ',
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 32,
                                fontWeight: FontWeight.w800,
                                color: myTextColor)),
                        TextSpan(
                            text: 'seguro',
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 32,
                                fontWeight: FontWeight.w800,
                                color: myTextColor)),
                      ])),
                      Text(
                        'Somos una institucion de salud que promueve y restaura la salud integral de las personas.',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 36 : 18,
                            fontWeight: FontWeight.w300,
                            color: myGreyColor),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )),
                if (isDesktop(context) || isTab(context))
                  Expanded(
                      child: Image.asset(
                    'images/logo.jpg',
                    height: size.height * 0.7,
                  ))
              ],
            )),
      ),
    );
  }
}