import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
          elevation: 1,
          backgroundColor: myWhiteColor,
          title: headerText(
              texto: 'Perfil',
              color: myPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w500)),
      body: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) => current is AuthSignedIn,
          builder: (_, state) {
            final authUser = (state as AuthSignedIn).user;
            return Scaffold(
              backgroundColor: bgGreyPage,
              body: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileEditPage);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _header(context),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cameron Cook',
                                style: TextStyle(
                                    color: myTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '${authUser.email}',
                                style: TextStyle(
                                    color: myGreyColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                    padding: EdgeInsets.all(8),
                    color: myWhiteColor,
                    child: Column(
                      children: [
                        _content(
                            context,
                            'Configuración',
                            AssetImage('images/settingicon.png'),
                            myTextColor,
                            () {}),
                        _content(context, 'Notificaciones',
                            AssetImage('images/noti.png'), myTextColor, () {}),
                        _content(
                            context,
                            'Métodos de pago',
                            AssetImage('images/payicon.png'),
                            myTextColor,
                            () {}),
                        _content(
                            context,
                            'Promociones',
                            AssetImage('images/promoicon.png'),
                            myTextColor,
                            () {}),
                        _content(
                            context,
                            'Sobre nosotros',
                            AssetImage('images/abouticon.png'),
                            myTextColor,
                            () {}),
                        _content(
                          context,
                          'Salir',
                          AssetImage('images/logouticon.png'),
                          myTextColor,
                          () => context.read<AuthCubit>().signOut(),
                        ),
                      ],
                    ),
                  )))
                ],
              ),
            );
          }),
    );
  }
}

Widget _header(BuildContext context) {
  return Container(
    alignment: Alignment.topCenter,
    color: bgGreyPage,
    height: 180,
    padding: EdgeInsets.all(30),
    child: Row(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1520223297779-95bbd1ea79b7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=966&q=80'),
        ),
      ],
    ),
  );
}

Widget _content(BuildContext context, String texto, ImageProvider<Object> icon,
    Color color, Function onClicAction) {
  return Card(
    elevation: 1,
    child: InkWell(
      onTap: () {
        onClicAction();
      },
      splashColor: myPrimaryColor,
      child: Container(
        margin: EdgeInsets.all(isMobile(context) ? 6 : 4),
        child: ListTile(
          leading: Image(
            image: icon,
            width: 29.0,
            height: 29.0,
            fit: BoxFit.cover,
          ),
          title: headerText(
              texto: texto, fontWeight: FontWeight.w400, fontSize: 18),
          trailing: Icon(
            Icons.chevron_right,
            color: myGreyColor,
          ),
        ),
      ),
    ),
  );
}
