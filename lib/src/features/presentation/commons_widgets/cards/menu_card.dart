import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../responsive.dart';

Widget moduleMenu(BuildContext context, String title, IconData icon,
    Color color, Function onClicAction) {
  return Card(
    elevation: 5,
    margin: EdgeInsets.all(8),
    child: InkWell(
      onTap: () {
        onClicAction();
      },
      splashColor: mySecondaryColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: isMobile(context) ? 70 : 90, color: color),
            Text(title, style: TextStyle(fontSize: isMobile(context) ? 18 : 18))
          ],
        ),
      ),
    ),
  );
}
