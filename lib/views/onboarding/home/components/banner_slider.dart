import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sidu_app/utils/const.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> banners = [
    "/assets/images/banner_sidu.jpg",
    "/assets/images/Banner_02.jpg",
    "/assets/images/",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 250),
      child: PageView.builder(
        controller: _pageController,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return _BannerImage(asset: banners[index]);
        },
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
      padding: const EdgeInsets.all(defaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(asset, fit: BoxFit.cover),
      ),
    );
  }
}