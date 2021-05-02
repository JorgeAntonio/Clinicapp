import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/main_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static Widget create(BuildContext context) => LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validator(String? value) {
    return (value == null || value.isEmpty) ? 'Este campo es necesario' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: myWhiteColor,
          elevation: 1,
          title: Text(
            'Iniciar sesion',
            style: TextStyle(
                color: myPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          )),
      body: BlocBuilder<AuthCubit, AuthState>(builder: (_, state) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: isMobile(context) ? 20 : 20, horizontal: 40),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: !isMobile(context) ? 90 : 10),
                      child: Column(
                        mainAxisAlignment: !isMobile(context)
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.center,
                        crossAxisAlignment: !isMobile(context)
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: isMobile(context) ? 20 : 20),
                          Text(
                            'Ingresar con email',
                            textAlign: isMobile(context)
                                ? TextAlign.center
                                : TextAlign.start,
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 32 : 18,
                                fontWeight: FontWeight.w400,
                                color: myTextColor),
                          ),
                          SizedBox(height: isMobile(context) ? 20 : 20),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Correo',
                            ),
                            validator: validator,
                          ),
                          SizedBox(height: isMobile(context) ? 10 : 20),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                            ),
                            validator: validator,
                          ),
                          SizedBox(height: isMobile(context) ? 10 : 20),
                          if (state is AuthSigningIn)
                            Center(child: CircularProgressIndicator()),
                          if (state is AuthError)
                            Text(state.message,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 24)),
                          SizedBox(height: isMobile(context) ? 10 : 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: MainButton(
                                title: 'Iniciar sesion',
                                tapEvent: () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    context
                                        .read<AuthCubit>()
                                        .signInUserWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text);
                                  }
                                },
                                color: myPrimaryColor),
                          ),
                          SizedBox(height: 20),
                          Wrap(
                            children: [
                              Text(
                                'No tengo una cuenta. ',
                                textAlign: isMobile(context)
                                    ? TextAlign.center
                                    : TextAlign.start,
                                style: TextStyle(
                                    fontSize: isDesktop(context) ? 30 : 16,
                                    fontWeight: FontWeight.w300,
                                    color: myTextColor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.popAndPushNamed(
                                      context, Routes.createAcount);
                                },
                                child: Text(
                                  ' Crear',
                                  textAlign: isMobile(context)
                                      ? TextAlign.center
                                      : TextAlign.start,
                                  style: TextStyle(
                                      fontSize: isDesktop(context) ? 30 : 16,
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
          ),
        );
      }),
    );
  }
}
