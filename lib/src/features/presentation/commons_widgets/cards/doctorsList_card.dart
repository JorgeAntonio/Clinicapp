import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../responsive.dart';

Widget especialistasCard(
    BuildContext context,
    String title,
    String details,
    String available,
    ImageProvider<Object> icon,
    Color color,
    Function onClicAction) {
  return Container(
    decoration: BoxDecoration(color: bgGreyPage),
    width: double.infinity,
    height: 130,
    child: Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onClicAction();
        },
        splashColor: color,
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
                    width: isMobile(context) ? 80 : 90,
                    height: isMobile(context) ? 80 : 90,
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
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile(context) ? 20 : 20)),
                    SizedBox(height: 3),
                    Text(
                      details,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: myGreyColor,
                          fontSize: isMobile(context) ? 16 : 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 16),
                        SizedBox(width: 3),
                        Text(
                          available,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: myTextColor,
                              fontSize: isMobile(context) ? 14 : 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
