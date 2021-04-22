import 'package:app_clinica/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_clinica/responsive.dart';
//COLORS

class DescriptionPage extends StatelessWidget {
  final String textTitle;
  final String textSubTitle;
  final String textIntroDetail;
  final String imagePath;

  const DescriptionPage({
    Key? key,
    required this.textTitle,
    required this.textSubTitle,
    required this.textIntroDetail,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(
                vertical: isMobile(context) ? 30 : 50, horizontal: 40),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
                  child: Column(
                    mainAxisAlignment: !isMobile(context)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: !isMobile(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      if (isMobile(context))
                        Image.asset(
                          imagePath,
                          height: size.height * 0.4,
                        ),
                      SizedBox(height: 20),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: textTitle,
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 45,
                                fontWeight: FontWeight.w800,
                                color: myPrimaryColor))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: textSubTitle,
                            style: TextStyle(
                                fontSize: isDesktop(context) ? 64 : 32,
                                fontWeight: FontWeight.w800,
                                color: myTextColor)),
                      ])),
                      SizedBox(height: 10),
                      Text(
                        textIntroDetail,
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 36 : 18,
                            fontWeight: FontWeight.w400,
                            color: myGreyColor),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )),
                if (isDesktop(context) || isTab(context))
                  Expanded(
                      child: Image.asset(
                    imagePath,
                    height: size.height * 0.7,
                  ))
              ],
            )),
      ),
    );
  }
}
