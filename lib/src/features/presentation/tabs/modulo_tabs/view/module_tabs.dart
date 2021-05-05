import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/appBar/appBar.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/cards/menu_card.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class ModuloTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: myWhiteColor,
        title: topBar(context, 'Clinicapp'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(color: bgGreyPage),
                padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        alignment: isMobile(context)
                            ? Alignment.centerLeft
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                          child: Wrap(
                            runSpacing: 10,
                            children: [
                              Icon(
                                Icons.warning,
                                size: isDesktop(context) ? 45 : 18,
                                color: myWhiteColor,
                              ),
                              SizedBox(width: 5),
                              headerText(
                                  texto: 'Alerta sobre el Covid-19',
                                  color: myWhiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile(context) ? 16 : 45),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _sliderCollections(),
                  ],
                ),
              ),
            ])),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: headerText(
                      texto: 'Servicios',
                      color: myTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile(context) ? 26 : 45),
                ),
              ),
            ])),
            SliverGrid.count(
              crossAxisCount: isMobile(context) ? 2 : 4,
              children: [
                moduleMenu(context, 'Encontrar doctor',
                    AssetImage('images/finddoctor.png'), myTextColor, () {
                  Navigator.pushNamed(context, Routes.findDoctorsPage);
                }),
                moduleMenu(
                    context,
                    'Historia clinica',
                    AssetImage('images/medical-history.png'),
                    myTextColor,
                    () {}),
                moduleMenu(context, 'Analisis', AssetImage('images/x-ray.png'),
                    myTextColor, () {}),
                moduleMenu(context, 'Laboratorio',
                    AssetImage('images/test-tubes.png'), myTextColor, () {})
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(color: bgGreyPage),
                  child: headerText(
                      texto: 'Actividades',
                      color: myTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile(context) ? 26 : 45),
                ),
              ),
              _sliderCollections(),
            ])),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(color: bgGreyPage),
                  child: headerText(
                      texto: 'Promociones',
                      color: myTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile(context) ? 26 : 45),
                ),
              ),
              _sliderCollections(),
            ])),
          ],
        ),
      ),
    );
  }
}

Widget _sliderCollections() {
  return Container(
    decoration: BoxDecoration(color: bgGreyPage),
    height: 200.0,
    child: Swiper(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _tarjetaCollection(context);
            });
      },
      index: 3,
    ),
  );
}

Widget _tarjetaCollection(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: myWhiteColor,
      boxShadow: [
        BoxShadow(
          color: Colors.red,
          //color: Color.fromRGBO(210, 211, 215, 1.0),
          offset: Offset(1, 5),
          blurRadius: 10.0,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
              width: 250,
              height: 180,
              fit: BoxFit.cover,
              image: AssetImage('images/covid19.jpg')),
        ),
      ],
    ),
  );
}
