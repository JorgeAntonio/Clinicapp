import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/cards/doctorsList_card.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';

class EspecialistDetailsPage extends StatefulWidget {
  static Widget create(BuildContext context) => EspecialistDetailsPage();

  @override
  _EspecialistDetailsPageState createState() => _EspecialistDetailsPageState();
}

class _EspecialistDetailsPageState extends State<EspecialistDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGreyPage,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgGreyPage,
          title: Text(
            'Especialistas',
            style: TextStyle(color: myTextColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: headerText(
                          texto: 'Lista de doctores',
                          textAlign: TextAlign.start,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: myTextColor),
                    ),
                  ),
                  especialistasCard(
                      context,
                      'Alexander Romero',
                      'Medico general',
                      'Disponible',
                      AssetImage('images/doctor.png'),
                      myPrimaryColor, () {
                    Navigator.pushNamed(context, Routes.doctorsProfilePage);
                  }),
                  especialistasCard(
                      context,
                      'Rocio Deglaine',
                      'Medico general',
                      'Disponible',
                      AssetImage('images/doctor-2.png'),
                      myPrimaryColor,
                      () {}),
                  especialistasCard(
                      context,
                      'Daniel Babilonia',
                      'Medico general',
                      'Disponible',
                      AssetImage('images/doctor.png'),
                      myPrimaryColor,
                      () {}),
                  especialistasCard(
                      context,
                      'Sandra Montez',
                      'Medico general',
                      'Disponible',
                      AssetImage('images/doctor-2.png'),
                      myPrimaryColor,
                      () {}),
                ],
              ),
            ),
          ),
        ));
  }
}
