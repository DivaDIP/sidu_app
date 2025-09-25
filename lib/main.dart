import 'package:flutter/material.dart';
import 'package:sidu_app/models/products_model.dart';
import 'package:sidu_app/utils/const.dart';
import 'package:sidu_app/views/auth/login_screen.dart';
import 'package:sidu_app/views/auth/register_screen.dart';
import 'package:sidu_app/views/details/detail_screen.dart';
import 'package:sidu_app/views/onboarding/home/catalogue_screen.dart';
import 'package:sidu_app/views/onboarding/onboarding_screen.dart';


void main() {
  runApp(SiduApp());
}


class SiduApp extends StatefulWidget {
  const SiduApp({super.key});

  @override
  State<SiduApp> createState() => _SiduAppState();
}

class _SiduAppState extends State<SiduApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Owala App",
      theme: ThemeData(
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity, //untuk mengatur kepadatan disetiap platform
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: textColor
          ),
          bodySmall: TextStyle(
            color: textColor
          ),
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/catalogue': (context) => CatalogueScreen(),
        '/detail': (context) => DetailScreen(
          product: ModalRoute.of(context)!.settings.arguments as ProductsModel,
        ),
      },
    );
  }
}