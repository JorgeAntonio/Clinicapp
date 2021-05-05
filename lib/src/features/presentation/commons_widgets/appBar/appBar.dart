import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';

Widget topBar(BuildContext context, String texto) {
  return Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          texto,
          style: TextStyle(
              color: myPrimaryColor, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Nueva cita',
              style: TextStyle(
                color: myGreyColor,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 30.0,
                color: myPrimaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.findDoctorsPage);
              },
            ),
          ],
        )
      ],
    ),
  );
}
