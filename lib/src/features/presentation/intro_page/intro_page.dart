import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/login_button.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/description_page/description_page.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;
    return AbsorbPointer(
      absorbing: isSigningIn,
      child: PageIndicatorContainer(
        child: PageView(
          children: [
            DescriptionPage(
                textTitle: 'Clinicapp',
                textSubTitle: 'Sientete seguro',
                textIntroDetail:
                    'Somos una Institución de salud que promueve y restaura la salud integral de las personas.',
                imagePath: 'images/logo1.jpg'),
            DescriptionPage(
                textTitle: 'Clinicapp',
                textSubTitle: 'Cerca de ti',
                textIntroDetail:
                    'Estamos ubicados en Calle Ricardo Palma 838 065 Iquitos, Perú . Abierto ahora',
                imagePath: 'images/logo8.jpg'),
            DescriptionPage(
                textTitle: 'Clinicapp',
                textSubTitle: 'Todo lo importante',
                textIntroDetail:
                    'Servicio de salud y seguridad en el trabajo · Servicio de emergencia y rescate · Hospital',
                imagePath: 'images/logo3.jpg'),
            _LoginPage(),
          ],
        ),
        length: 4,
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: isMobile(context) ? 150 : 0),
            margin: EdgeInsets.symmetric(
                vertical: isMobile(context) ? 20 : 40, horizontal: 40),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(
                    right: !isMobile(context) ? 40 : 0,
                    left: !isMobile(context) ? 40 : 0,
                  ),
                  child: Column(
                    mainAxisAlignment: !isMobile(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.center,
                    crossAxisAlignment: !isMobile(context)
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.center,
                    children: <Widget>[
                      /*Icon(
                        Icons.medical_services_outlined,
                        size: isDesktop(context) ? 64 : 45,
                        color: mySecondaryColor,
                      ),*/
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Clinicapp',
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 45,
                                fontWeight: FontWeight.w800,
                                color: myPrimaryColor))
                      ])),
                      SizedBox(height: 20),
                      Text(
                        'Ingresar o crear una cuenta.',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.center,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 36 : 18,
                            fontWeight: FontWeight.bold,
                            color: myTextColor),
                      ),
                      if (isSigningIn) CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(
                            right: !isMobile(context) ? 130 : 20,
                            left: !isMobile(context) ? 130 : 20),
                        child: Center(
                          child: Wrap(
                            runSpacing: 15,
                            children: <Widget>[
                              LoginButton(
                                  text: 'Ingresar con correo',
                                  imagePath: 'images/email2.png',
                                  color: mySecondaryColor,
                                  textColor: myWhiteColor,
                                  onTap: () {
                                    context.read<AuthCubit>().reset();
                                    Navigator.pushNamed(
                                        context, Routes.signInEmail);
                                  }),
                              LoginButton(
                                text: 'Ingresar con Google',
                                imagePath: 'images/google.png',
                                color: myWhiteColor,
                                textColor: myGreyColor,
                                onTap: () => context
                                    .read<AuthCubit>()
                                    .signInWithGoogle(),
                              ),
                              LoginButton(
                                text: 'Ingresar con Facebook',
                                imagePath: 'images/facebook.png',
                                color: myBlueColor,
                                textColor: myWhiteColor,
                                onTap: () => context
                                    .read<AuthCubit>()
                                    .signInWithFacebook(),
                              ),
                              LoginButton(
                                text: 'Ingresar anonimamente',
                                imagePath: 'images/anonimo.png',
                                color: myGreyColor,
                                textColor: myWhiteColor,
                                onTap: () => context
                                    .read<AuthCubit>()
                                    .signInAnonymously(),
                              ),
                              SizedBox(height: 40),
                              Container(
                                alignment: Alignment.center,
                                child: OutlinedButton(
                                    style: ElevatedButton.styleFrom(
                                        onSurface: myPrimaryColor,
                                        side:
                                            BorderSide(color: myPrimaryColor)),
                                    child: Text('Crear cuenta',
                                        style: TextStyle(color: myTextColor)),
                                    onPressed: () {
                                      context.read<AuthCubit>().reset();
                                      Navigator.pushNamed(
                                          context, Routes.createAcount);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            )),
      ),
    );
  }
}
