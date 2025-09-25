import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/views/onboarding/home/components/app_bar.dart';
// import 'package:owala_app/views/onboarding/home/components/balance_cart.dart';
import 'package:owala_app/views/onboarding/home/components/banner_slider.dart';
import 'package:owala_app/views/onboarding/home/components/bottom_navbar.dart';
import 'package:owala_app/views/onboarding/home/components/categories.dart';
import 'package:owala_app/views/onboarding/home/components/drinkware_grid.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _widgetOptions = [
    // TODO: menampilkan list dari widget yang akan ditampilkan di bottom navbar
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? CatalogeuAppBar() : null,
      body: _selectedIndex == 0
          ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BalanceCard(),
                BannerSlider(),
                SizedBox(height: 15,),
                Categories(),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Text(
                    "Our Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor
                    ),
                  ),
                ),
                DrinkwareGrid()
              ],
            ),
          )
        : _widgetOptions[_selectedIndex - 1], // karna tab ke-0 merupakan katalog screen
        bottomNavigationBar: BottomNavbar(
          selectedIndex: _selectedIndex,
          onItemsTapped: _onItemTapped,
        ),
    );
  }
}