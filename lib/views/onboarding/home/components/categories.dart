import 'package:flutter/material.dart';
import 'package:sidu_app/utils/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

List<Map<String, dynamic>> categories = [
  {
    "icon": Icons.book,
    "text": "Buku Tulis",
  },
  {
    "icon": Icons.draw,
    "text": "Drawing Book",
  },
  {
    "icon": Icons.note,
    "text": "Kertas",
  },
  {
    "icon": Icons.create,
    "text": "Accesories",
  }, 
];

int selectedIndex = 0;

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
            "Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor
            ),
          ),
          Spacer(),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text(
          //     "View all",
          //     style: TextStyle(
          //       color: Color(0xFFF28B30),
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold
          //     ),
          //   ),
          // )
          ],
        ),
        SizedBox(height: defaultPadding,),
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => _buildCategory(index),
           ),
        )
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10), // kurangi paddinga gar lebih kecil
              decoration: BoxDecoration(
                color: selectedIndex == index ? primaryColor.withValues(alpha: 0.2) : Colors.grey.withValues(alpha: 0.0),
                shape: BoxShape.circle
              ),
              child: Icon(
                categories[index]["icon"],
                color: selectedIndex == index ? secondaryColor : primaryColor,
                size: 20,
              ),
            ),
            SizedBox(height: 7,),
            Text(
              categories[index]["text"],
              style: TextStyle(
                color: selectedIndex == index ? secondaryColor : primaryColor,
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );
  }
}