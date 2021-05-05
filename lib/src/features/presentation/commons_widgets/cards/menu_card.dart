import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../responsive.dart';

Widget moduleMenu(BuildContext context, String title,
    ImageProvider<Object> icon, Color color, Function onClicAction) {
  return Container(
    decoration: BoxDecoration(color: bgGreyPage),
    width: 190,
    height: 190,
    child: Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onClicAction();
        },
        splashColor: myPrimaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: isMobile(context)
                ? MainAxisAlignment.center
                : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                      width: 70, height: 70, fit: BoxFit.cover, image: icon),
                ),
              ),
              //Icon(icon, size: isMobile(context) ? 70 : 90, color: color),
              Text(title,
                  style: TextStyle(fontSize: isMobile(context) ? 18 : 18))
            ],
          ),
        ),
      ),
    ),
  );
}
