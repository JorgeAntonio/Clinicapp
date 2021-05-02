import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindDoctorsPage extends StatefulWidget {
  static Widget create(BuildContext context) => FindDoctorsPage();
  FindDoctorsPage({Key? key}) : super(key: key);

  @override
  _FindDoctorsPageState createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGreyPage,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: myWhiteColor,
          title: Text(
            'Doctores',
            style: TextStyle(color: myTextColor),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: headerText(
                        texto: 'Encuentra tu doctor',
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                        color: myTextColor,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CupertinoSearchTextField(
                    placeholder: 'Buscar',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: headerText(
                        texto: '40 doctores',
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                        color: myTextColor,
                        fontSize: 16),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _doctorCard(context),
                        _doctorCard(context),
                        _doctorCard(context),
                        _doctorCard(context),
                        _doctorCard(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _doctorCard(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            color: myWhiteColor,
            height: 210,
            width: 160,
            child: Image.asset(
              'images/doctorProfile.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        _doctorDetailsCard(context)
      ],
    ),
  );
}

Widget _doctorDetailsCard(BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Container(
          height: 210,
          color: myWhiteColor,
          padding: EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 5,
            children: [
              headerText(
                texto: 'Victoria Bozhook',
                textAlign: TextAlign.start,
                fontSize: 16,
                color: myTextColor,
                fontWeight: FontWeight.bold,
              ),
              headerText(
                texto: 'Dentista-Orthopedista',
                textAlign: TextAlign.start,
                fontSize: 13,
                color: myTextColor,
                fontWeight: FontWeight.w400,
              ),
              headerText(
                texto: 'Experiencia: 10 años',
                textAlign: TextAlign.start,
                fontSize: 13,
                color: myGreyColor,
                fontWeight: FontWeight.w400,
              ),
              headerText(
                texto: 'Adoro a mis pacientes. Amo mi trabajo',
                textAlign: TextAlign.justify,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: myGreyColor,
              ),
              headerText(
                texto: 'Disponible',
                textAlign: TextAlign.start,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: myTextColor,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer),
                      Text(
                        '9.00 A.M - 6.00 P.M',
                        style: TextStyle(color: myGreyColor),
                      ),
                    ],
                  ),
                  Text(
                    'LUN-VIER',
                    style: TextStyle(color: myGreyColor),
                  ),
                ],
              ),
              Container(
                height: 24,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.newSchedulePage);
                  },
                  child: Text(
                    'Agendar cita',
                    style: TextStyle(color: myPrimaryColor),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: myPrimaryColor,
                    side: BorderSide(color: myPrimaryColor),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
