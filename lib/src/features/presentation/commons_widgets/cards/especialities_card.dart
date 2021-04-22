import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../responsive.dart';

Widget especialitiesCard(BuildContext context, String title, String details,
    ImageProvider<Object> icon, Color color, Function onClicAction) {
  return Container(
    decoration: BoxDecoration(color: bgGreyPage),
    width: double.infinity,
    height: 90,
    child: Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onClicAction();
        },
        splashColor: mySecondaryColor,
        child: Container(
          margin: EdgeInsets.all(isMobile(context) ? 6 : 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    width: isMobile(context) ? 40 : 50,
                    height: isMobile(context) ? 40 : 50,
                    fit: BoxFit.cover,
                    image: icon,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isMobile(context) ? 18 : 18)),
                    SizedBox(height: 3),
                    Text(
                      details,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: myGreyColor,
                          fontSize: isMobile(context) ? 14 : 14),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
