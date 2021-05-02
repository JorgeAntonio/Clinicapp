import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';

class DoctorsProfilePage extends StatefulWidget {
  static Widget create(BuildContext context) => DoctorsProfilePage();

  @override
  _DoctorsProfilePageState createState() => _DoctorsProfilePageState();
}

class _DoctorsProfilePageState extends State<DoctorsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: myWhiteColor,
        centerTitle: true,
        title: Text('Doctor', style: TextStyle(color: myTextColor)),
      ),
      backgroundColor: bgGreyPage,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20),
              _tarjetaDoctor(context),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                height: 390,
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: headerText(
                            texto: 'Dr. Laura Ramirez',
                            textAlign: TextAlign.center,
                            fontSize: 26,
                            color: myTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      headerText(
                          texto: 'Dentista',
                          textAlign: TextAlign.center,
                          fontSize: 20,
                          color: myGreyColor,
                          fontWeight: FontWeight.w400),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: headerText(
                              texto: 'Acerca del doctor',
                              textAlign: TextAlign.start,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: myGreyColor),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: headerText(
                              texto:
                                  'Especialista en odontologia. Adoro a mis pacientes y trabajo en la clinica San Juan en Iquitos, Peru.',
                              textAlign: TextAlign.center,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: myTextColor),
                        ),
                      ),
                      SizedBox(height: 10),
                      _doctorTimeCard(
                        context,
                        'Disponible',
                        '9.00 A.M - 6.00 P.M',
                        'LUN-VIER',
                        AssetImage('images/cardiology.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                height: 80,
                child: _mainButton('Agendar cita', () {
                  Navigator.pushNamed(context, Routes.newSchedulePage);
                }, myPrimaryColor),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tarjetaDoctor(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: myWhiteColor,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          offset: Offset(1, 5),
          blurRadius: 10.0,
        )
      ],
    ),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
                width: 150,
                height: 200,
                fit: BoxFit.cover,
                image: AssetImage('images/doctor-2.png')),
          ),
        ],
      ),
    ),
  );
}

Widget _doctorTimeCard(
  BuildContext context,
  String available,
  String time,
  String day,
  ImageProvider<Object> icon,
) {
  return Container(
    decoration: BoxDecoration(color: myWhiteColor),
    width: double.infinity,
    height: 125,
    child: Container(
      margin: EdgeInsets.all(isMobile(context) ? 6 : 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                width: isMobile(context) ? 80 : 90,
                height: isMobile(context) ? 80 : 90,
                fit: BoxFit.cover,
                image: icon,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(available,
                    style: TextStyle(
                        color: myGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile(context) ? 18 : 18)),
                SizedBox(height: 5),
                Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: myTextColor,
                      fontSize: isMobile(context) ? 20 : 20),
                ),
                Text(
                  day,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: myGreyColor,
                      fontSize: isMobile(context) ? 20 : 20),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _mainButton(String title, GestureTapCallback tapEvent, Color color) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: TextButton(
      onPressed: tapEvent,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 35, vertical: 15))),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      ),
    ),
  );
}
