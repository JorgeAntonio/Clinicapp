import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/main_button.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: myWhiteColor));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(
            vertical: isMobile(context) ? 20 : 70, horizontal: 40),
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
                      'images/logo2.png',
                      height: size.height * 0.4,
                    ),
                  SizedBox(height: 10),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Bienvenido',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 64 : 32,
                            fontWeight: FontWeight.w800,
                            color: myPrimaryColor))
                  ])),
                  SizedBox(height: isMobile(context) ? 5 : 10),
                  Text(
                    'Ingresa con tus credenciales',
                    textAlign:
                        isMobile(context) ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 30 : 18,
                        fontWeight: FontWeight.w300,
                        color: myGreyColor),
                  ),
                  SizedBox(height: isMobile(context) ? 20 : 20),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(142, 142, 147, 1.2),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Correo',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: isMobile(context) ? 10 : 20),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(142, 142, 147, 1.2),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Contraseña',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      onChanged: (value) {
                        _password = value.trim();
                      },
                    ),
                  ),
                  SizedBox(height: isMobile(context) ? 20 : 20),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Olvidaste tu contraseña?',
                      textAlign: isMobile(context)
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                          fontSize: isDesktop(context) ? 30 : 13,
                          fontWeight: FontWeight.w300,
                          color: myGreyColor),
                    ),
                  ),
                  SizedBox(height: isMobile(context) ? 20 : 20),
                  Container(
                    height: 45,
                    width: double.infinity,
                    child: MainButton(
                        title: 'Ingresar',
                        tapEvent: () {
                          auth.signInWithEmailAndPassword(
                              email: _email, password: _password);
                          Navigator.pushNamed(context, 'tabs');
                        },
                        color: myPrimaryColor),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    children: [
                      Text(
                        'No tienes una cuenta? ',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 30 : 13,
                            fontWeight: FontWeight.w300,
                            color: myGreyColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'singin');
                        },
                        child: Text(
                          'Registrate',
                          textAlign: isMobile(context)
                              ? TextAlign.center
                              : TextAlign.start,
                          style: TextStyle(
                              fontSize: isDesktop(context) ? 30 : 13,
                              fontWeight: FontWeight.bold,
                              color: myPrimaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
            if (isDesktop(context) || isTab(context))
              Expanded(
                  child: Image.asset(
                'images/logo2.png',
                height: size.height * 0.7,
              ))
          ],
        ),
      )),
    );
  }
}
/*
Widget _emailInput() {
  final TextEditingController _emailController = TextEditingController();
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(20.0)),
    child: TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Correo',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput() {
  final TextEditingController _passwordController = TextEditingController();
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(20.0)),
    child: TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _phoneInput() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(20.0)),
    child: TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'Telefono',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
*/
