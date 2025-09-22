import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/const.dart';

class AddToCart extends StatelessWidget {
  final ProductsModel product;
  final int quantity;

  const AddToCart({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: product.color),
            ),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart_outlined),
              onPressed: () {
                // TODO 1: menambahkan product ke halaman keranjang
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: 
                    Text(
                      "successfully added ${product.title}"
                    ),
                    duration: Duration(seconds: 2),
                  )
                );
              },
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: product.color,
                maximumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                )
              ),
              onPressed: () {
                // TODO 2: direct button buy now ke halaman cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${product.title} is purchased",
                    ),
                    duration: Duration(seconds: 2),
                  )
                );
              },
              child: Text(
                "Buy now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}