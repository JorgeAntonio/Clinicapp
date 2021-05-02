import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/appBar/appBar.dart';
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
        title: topBar(context),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) => current is AuthSignedIn,
          builder: (_, state) {
            final authUser = (state as AuthSignedIn).user;
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Icon(
                        Icons.person_outline,
                        size: 70,
                      ),
                    ),
                  ),
                  Text('Usuario: ${authUser.uid}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () => context.read<AuthCubit>().signOut(),
                      child: Text('Salir')),
                ],
              ),
            );
          }),
    );
  }
}
