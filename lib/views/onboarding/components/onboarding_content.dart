import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/utils/size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.text, required this.image});

  final String text, image;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Center(
          child:
           Image.asset(
            'assets/images/logo_sidu.png',
            fit: BoxFit.cover,
            ),
        ), 
          Spacer(),
          Text(
            "Sinar Dunia",
            style: TextStyle(
              color: primaryColor,
              fontSize: getProporsionateScreenWidht(36.0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            text,
            textAlign: TextAlign.center,
             style: TextStyle(
            color: textColor
          ),
          )
      ],
    );
  }
}