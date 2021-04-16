import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/cards/menu_card.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

class ModuloTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blanco,
          title: Text('Clinicapp',
              style: TextStyle(
                  fontSize: isMobile(context) ? 32 : 45,
                  fontWeight: FontWeight.bold,
                  color: myPrimaryColor)),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: bgGreyPage,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: bgGreyPage,
              title: Padding(
                padding: EdgeInsets.only(
                    top: isDesktop(context) ? 30 : 0,
                    bottom: isDesktop(context) ? 30 : 0),
                child: headerText(
                    texto: 'Modulo de atención',
                    fontSize: isMobile(context) ? 30 : 45),
              ),
              automaticallyImplyLeading: false,
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              sliver: SliverGrid.count(
                crossAxisCount: isMobile(context) ? 2 : 4,
                mainAxisSpacing: 10.0,
                children: [
                  moduleMenu(context, 'Especialidades',
                      Icons.medical_services_sharp, myTextColor, () {
                    Navigator.pushNamed(context, '');
                  }),
                  moduleMenu(context, 'Citas', Icons.schedule, myTextColor, () {
                    Navigator.pushNamed(context, '');
                  }),
                  moduleMenu(
                      context, 'Doctores', Icons.person_add_alt, myTextColor,
                      () {
                    Navigator.pushNamed(context, '');
                  }),
                  moduleMenu(
                      context, 'Promociones', Icons.card_giftcard, myTextColor,
                      () {
                    Navigator.pushNamed(context, '');
                  }),
                  moduleMenu(context, 'Eventos', Icons.event, myTextColor, () {
                    Navigator.pushNamed(context, '');
                  }),
                  moduleMenu(context, 'Otros servicios',
                      Icons.devices_other_sharp, myTextColor, () {
                    Navigator.pushNamed(context, '');
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
