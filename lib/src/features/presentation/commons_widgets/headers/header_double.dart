import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

import 'header_text.dart';
//Common Widgets

//Colors

Widget headerDoubleText(
    {required String textHeader,
    required String textAction,
    required Function func}) {
  return Container(
    child: Row(
      children: [
        headerText(texto: textHeader, fontSize: 20.0),
        Spacer(),
        GestureDetector(
          onTap: () => func,
          child: headerText(
              texto: textAction,
              color: myPrimaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        )
      ],
    ),
  );
}
