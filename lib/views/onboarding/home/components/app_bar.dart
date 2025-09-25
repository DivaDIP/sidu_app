import 'package:flutter/material.dart';
// import 'package:owala_app/utils/const.dart';

class CatalogeuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatalogeuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 120, // biar cukup untuk search bar
      title: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_outlined, color: Color(0xFF3B5B8A)),
                ),
                Spacer(),
                Text(
                  "Home",
                  style: TextStyle(
                    color: Color(0xFF3B5B8A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none, color: Color(0xFF3B5B8A)),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFF6E86AA),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
