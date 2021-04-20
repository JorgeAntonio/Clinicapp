import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/login_button.dart';
import 'package:flutter/material.dart';
import 'package:app_clinica/responsive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      SizedBox(height: 10),
                      Text(
                        'Ingresar o crear una cuenta.',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 36 : 18,
                            fontWeight: FontWeight.bold,
                            color: myTextColor),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(
                            right: !isMobile(context) ? 20 : 20,
                            left: !isMobile(context) ? 0 : 20),
                        child: Wrap(
                          runSpacing: 10,
                          children: <Widget>[
                            LoginButton(
                              text: 'Ingresar con correo',
                              imagePath: 'images/loginIcon.png',
                              color: myPrimaryColor,
                              textColor: myWhiteColor,
                              onTap: () {
                                Navigator.pushNamed(context, 'login');
                              },
                            ),
                            LoginButton(
                              text: 'Ingresar con Google',
                              imagePath: 'images/loginIcon.png',
                              color: myWhiteColor,
                              textColor: myGreyColor,
                              onTap: () {},
                            ),
                            LoginButton(
                              text: 'Ingresar con Facebook',
                              imagePath: 'images/loginIcon.png',
                              color: myBlueColor,
                              textColor: myWhiteColor,
                              onTap: () {},
                            ),
                            LoginButton(
                              text: 'Ingresar anonimamente',
                              imagePath: 'images/loginIcon.png',
                              color: myTextColor,
                              textColor: myWhiteColor,
                              onTap: () =>
                                  context.read<AuthCubit>().signInAnonymously(),
                            ),
                            SizedBox(height: 40),
                            Container(
                              alignment: Alignment.center,
                              child: OutlinedButton(
                                child: Text('Crear una cuenta',
                                    style: TextStyle(color: myTextColor)),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'singin');
                                },
                              ),
                            ),
                          ],
                        ),
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
