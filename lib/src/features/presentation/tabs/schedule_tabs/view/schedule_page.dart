import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/appBar/appBar.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: myWhiteColor,
        title: topBar(context),
      ),
      body: Center(
        child: Text('Mis Citas'),
      ),
    );
  }
}
