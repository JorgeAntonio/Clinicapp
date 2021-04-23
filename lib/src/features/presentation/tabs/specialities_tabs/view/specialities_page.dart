import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/cards/especialities_card.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: myWhiteColor,
        title: Text(
          'Especialidades',
          style: TextStyle(color: myPrimaryColor, fontSize: 24),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  'Nueva cita',
                  style: TextStyle(
                      color: myGreyColor, fontWeight: FontWeight.w500),
                ),
                Container(
                    width: 40.0,
                    height: 40.0,
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: mySecondaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          Icons.add_circle_outline_sharp,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.newSchedulePage);
                        }))
              ],
            ),
          )
        ],
      ),
      backgroundColor: bgGreyPage,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: headerText(
                        texto: 'Todas las especialidades',
                        textAlign: TextAlign.start,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: myTextColor),
                  ),
                ),
                especialitiesCard(
                    context,
                    'Medicina general',
                    '4 Especialistas',
                    AssetImage('images/stethoscope.png'),
                    myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Pediatria', '2 Especialistas',
                    AssetImage('images/newborn.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Oftalmologia', '1 Especialistas',
                    AssetImage('images/ophthalmology.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Cardiologia', '2 Especialistas',
                    AssetImage('images/cardiology.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Obstetricia', '3 Especialistas',
                    AssetImage('images/pregnancy.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Cirugia', '2 Especialistas',
                    AssetImage('images/surgery.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Odontologia', '2 Especialistas',
                    AssetImage('images/tooth.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                }),
                especialitiesCard(context, 'Laboratorio', '2 Especialistas',
                    AssetImage('images/test-tubes.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.especialistDetailsPage);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
