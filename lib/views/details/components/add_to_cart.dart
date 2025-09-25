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
            margin: EdgeInsets.only(right: 50), // jarak antara harga & tombol
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Rp ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF28B30),
                  ),
                ),
                Text(
                  "${product.price}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF28B30),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF28B30), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.title} added to cart"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined, 
                color: Colors.white,
                
                ),
              label: Text(
                "Add to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
