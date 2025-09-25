import 'package:flutter/material.dart';
import 'package:sidu_app/models/products_model.dart';
import 'package:sidu_app/utils/const.dart';

class Description extends StatelessWidget {
  final ProductsModel product;

  const Description({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Text(
        product.description,
        style: TextStyle(
          height: 1.5,
          fontWeight: FontWeight.w500,
          color: Color(0xFF3B5B8A)
        ),
      ),
    );
  }
}