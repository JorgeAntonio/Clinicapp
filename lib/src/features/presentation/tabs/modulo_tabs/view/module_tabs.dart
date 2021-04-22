import 'package:app_clinica/responsive.dart';
import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/cards/menu_card.dart';
import 'package:app_clinica/src/features/presentation/commons_widgets/headers/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class ModuloTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            _topBar(context),
            Container(
              decoration: BoxDecoration(color: bgGreyPage),
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    alignment: isMobile(context)
                        ? Alignment.centerLeft
                        : Alignment.centerLeft,
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        headerText(
                            texto: 'COVID-19',
                            color: myTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile(context) ? 26 : 45),
                        SizedBox(width: 10),
                        Padding(
                          padding:
                              EdgeInsets.only(top: isMobile(context) ? 8 : 20),
                          child: headerText(
                              texto: 'Sugerencias',
                              color: myTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: isMobile(context) ? 16 : 24),
                        ),
                      ],
                    ),
                  ),
                  _sliderCollections(),
                ],
              ),
            ),
          ])),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: bgGreyPage),
              child: headerText(
                  texto: 'Modulo de atencion',
                  color: myTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile(context) ? 26 : 45),
            )
          ])),
          SliverGrid.count(
            crossAxisCount: isMobile(context) ? 2 : 4,
            children: [
              moduleMenu(context, 'Historia clinica',
                  AssetImage('images/medical-history.png'), myTextColor, () {}),
              moduleMenu(context, 'Analisis', AssetImage('images/x-ray.png'),
                  myTextColor, () {}),
              moduleMenu(context, 'Encontrar doctor',
                  AssetImage('images/finddoctor.png'), myTextColor, () {}),
              moduleMenu(context, 'Laboratorio',
                  AssetImage('images/test-tubes.png'), myTextColor, () {})
            ],
          ),
        ],
      ),
    );
  }
}

Widget _topBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        headerText(
            texto: 'Clinicapp',
            color: myPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: isMobile(context) ? 32 : 45),
        Spacer(),
        Text(
          'Nueva cita',
          style: TextStyle(color: myGreyColor, fontWeight: FontWeight.w500),
        ),
        Container(
            width: 40.0,
            height: 40.0,
            margin: EdgeInsets.only(left: 10),
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
                  //Navigator.pushNamed(context, 'filter');
                }))
      ],
    ),
  );
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
          color: Color.fromRGBO(210, 211, 215, 1.0),
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
              image: AssetImage('images/logo8.jpg')),
        ),
      ],
    ),
  );
}
