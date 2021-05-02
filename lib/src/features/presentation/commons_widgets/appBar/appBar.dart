import 'package:app_clinica/src/colors/colors.dart';
import 'package:app_clinica/src/routes/routes.dart';
import 'package:flutter/material.dart';

Widget topBar(BuildContext context) {
  return Container(
    width: double.infinity,
    color: myWhiteColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Clinicapp',
          style: TextStyle(color: myPrimaryColor, fontSize: 26),
        ),
        Row(
          children: [
            Container(
              child: Text(
                'Nueva cita',
                style: TextStyle(
                    color: myGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: myPrimaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    size: 25.0,
                    color: myWhiteColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.findDoctorsPage);
                  }),
            )
          ],
        )
      ],
    ),
  );
}
