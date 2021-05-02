import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

class ScheduleDetailsPage extends StatefulWidget {
  ScheduleDetailsPage({Key? key}) : super(key: key);
  static create(BuildContext context) => ScheduleDetailsPage();

  @override
  _ScheduleDetailsPageState createState() => _ScheduleDetailsPageState();
}

class _ScheduleDetailsPageState extends State<ScheduleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        backgroundColor: myWhiteColor,
        elevation: 1,
        title: Text(
          'Confirmar pago',
          style: TextStyle(color: myTextColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
