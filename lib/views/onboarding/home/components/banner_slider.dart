import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 180,
      ),
      child: PageView(
        children: [
          _BannerImage(asset: "assets/images/Banner_01.jpeg"),
          _BannerImage(asset: "assets/images/Banner_02.jpg"),
          _BannerImage(asset: "assets/images/Banner_03.jpeg"),
        ],
      ),
    );
  }
}

class _BannerImage extends StatelessWidget {
  final String asset;


  const _BannerImage({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Image.asset(asset, fit: BoxFit.cover,),
    );
  }
}