import 'package:app_clinica/src/bloc/auth_cubit.dart';
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
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) => current is AuthSignedIn,
          builder: (_, state) {
            final authUser = (state as AuthSignedIn).user;
            return Center(
              child: Column(
                children: [
                  Text('Usurio: ${authUser.uid}'),
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
