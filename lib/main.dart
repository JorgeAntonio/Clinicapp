import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/repository/implementation/auth_repository.dart';
import 'package:flutter/material.dart';
//FIREBASE
import 'package:firebase_core/firebase_core.dart';
//ROUTES
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authCubit = AuthCubit(AuthRepository());
  runApp(
    BlocProvider(
      create: (_) => authCubit..init(),
      child: MyApp.create(),
    ),
  );
}

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.intro, (route) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.tabs, (route) => false);
        }
      },
      child: MyApp(),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      onGenerateRoute: Routes.routes,
      debugShowCheckedModeBanner: false,
      title: 'ClinicApp',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          //textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
    );
  }
}
