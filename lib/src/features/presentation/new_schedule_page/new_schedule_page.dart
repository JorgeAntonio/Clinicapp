import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

class NewSchedulePage extends StatefulWidget {
  static create(BuildContext context) => NewSchedulePage();

  @override
  _NewSchedulePageState createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: myWhiteColor,
        title: Text(
          'Agendar Cita',
          style: TextStyle(color: myTextColor),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Por favor seleccione el día y hora antes del día de su consulta',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: myGreyColor),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
