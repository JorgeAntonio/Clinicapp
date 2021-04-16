import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:app_clinica/responsive.dart';
//COLORS

class WelcomePage extends StatelessWidget {
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
                            color: gris),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        runSpacing: 10,
                        children: <Widget>[
                          MainButton(
                              title: 'Continuar',
                              tapEvent: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              color: myPrimaryColor),
                          SizedBox(width: 10),
                          MainButton(
                              title: 'Saber más',
                              tapEvent: () {},
                              color: mySecondaryColor)
                        ],
                      )
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
