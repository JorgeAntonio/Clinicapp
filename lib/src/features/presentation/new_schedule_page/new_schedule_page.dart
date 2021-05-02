import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/buttons/main_button.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class NewSchedulePage extends StatefulWidget {
  static create(BuildContext context) => NewSchedulePage();

  @override
  _NewSchedulePageState createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
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
          child: SingleChildScrollView(
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: myGreyColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Datos del paciente',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: myTextColor),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombres & Apellidos',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'DNI',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Elige una fecha',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: myTextColor),
                ),
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2015, 01, 01),
              lastDay: DateTime.utc(2040, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Elige una hora',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: myTextColor),
                ),
              ),
            ),
            _selectTime(),
            _selectTime(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MainButton(
                    title: 'Confirmar cita',
                    tapEvent: () {
                      Navigator.pushNamed(context, Routes.scheduleDetailsPage);
                    },
                    color: myPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}

Widget _selectTime() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: mySecondaryColor, blurRadius: 1),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: myWhiteColor,
                  child: Center(
                    child: headerText(
                        texto: "08:00",
                        color: myTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: mySecondaryColor, blurRadius: 1),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: myWhiteColor,
                  child: Center(
                    child: headerText(
                        texto: "09:00",
                        color: myTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: mySecondaryColor, blurRadius: 1),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: mySecondaryColor,
                  child: Center(
                    child: headerText(
                        texto: "10:00",
                        color: myWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: mySecondaryColor, blurRadius: 1),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: myWhiteColor,
                  child: Center(
                    child: headerText(
                        texto: "11:00",
                        color: myTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: mySecondaryColor, blurRadius: 1),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: myWhiteColor,
                  child: Center(
                    child: headerText(
                        texto: "12:00",
                        color: myTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
