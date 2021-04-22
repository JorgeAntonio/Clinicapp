import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/main_button.dart';
import 'package:app_clinica/src/features/presentation/singIn_page/model/firebase.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInPage extends StatefulWidget {
  static Widget create(BuildContext context) => SingInPage();
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'Este campo es necesario' : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Este campo es necesario';
    if (value.length < 6)
      return 'La contraseña debe tener al menos 6 caracteres';
    if (_passwordController.text != _confirmPasswordController.text)
      return 'Las contraseñas no coinciden';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: myWhiteColor,
          elevation: 0,
          title: Text(
            'Crear cuenta',
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
                            'Registrate con tu email',
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
                            validator: emailValidator,
                          ),
                          SizedBox(height: isMobile(context) ? 10 : 20),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                            ),
                            validator: passwordValidator,
                          ),
                          SizedBox(height: isMobile(context) ? 10 : 20),
                          TextFormField(
                            obscureText: true,
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirmar contraseña',
                            ),
                            validator: passwordValidator,
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
                                title: 'Crear',
                                tapEvent: () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    context
                                        .read<AuthCubit>()
                                        .createUserWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text);
                                    addUser(_emailController.text,
                                        _passwordController.text);
                                  }
                                },
                                color: myPrimaryColor),
                          ),
                          SizedBox(height: 20),
                          Wrap(
                            children: [
                              Text(
                                'Ya tengo una cuenta.  ',
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
                                      context, Routes.signInEmail);
                                },
                                child: Text(
                                  ' Ingresar',
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
