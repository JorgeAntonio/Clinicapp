import 'package:app_clinica/responsive.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blueAccent,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 5),
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
              ),
              SizedBox(width: 10),
              Text(text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile(context) ? 16 : 16))
            ],
          ),
        ),
      ),
    );
  }
}
