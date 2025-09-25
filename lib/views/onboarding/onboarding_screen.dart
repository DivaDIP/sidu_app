import 'package:flutter/material.dart';
import 'package:sidu_app/utils/size_config.dart';
import 'package:sidu_app/views/onboarding/components/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      body: Body(), //to do membuat class body yang berisi komponen hal onboarding
    );
  }
}