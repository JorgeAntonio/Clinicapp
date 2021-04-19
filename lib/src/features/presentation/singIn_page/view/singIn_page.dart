import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/main_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  String _email = '', _password = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(
            vertical: isMobile(context) ? 20 : 70, horizontal: 40),
        child: Form(
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
                      SizedBox(height: 10),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Registrarse',
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 32,
                                fontWeight: FontWeight.w800,
                                color: myPrimaryColor))
                      ])),
                      SizedBox(height: isMobile(context) ? 5 : 10),
                      Text(
                        'Registrate con tus credenciales',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
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
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
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
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          onChanged: (value) {
                            setState(() {
                              _password = value.trim();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: isMobile(context) ? 20 : 20),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: MainButton(
                            title: 'Registrarse',
                            tapEvent: () {
                              auth.createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                              Navigator.pushNamed(context, 'login');
                            },
                            color: myPrimaryColor),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        children: [
                          Text(
                            'Ya tengo una cuenta  ',
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
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text(
                              ' Ingresar',
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
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
/*
Widget _emailInput(onChange()) {
  return Container(
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
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput() {
  return Container(
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
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
*/
