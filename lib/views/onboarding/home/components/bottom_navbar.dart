import 'package:flutter/material.dart';
import 'package:sidu_app/utils/const.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemsTapped;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemsTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: _buildNavIcon(Icons.home, "Home", 0),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: _buildNavIcon(Icons.favorite, "Wishlist", 1),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: _buildNavIcon(Icons.chat_bubble, "Setting", 2),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: _buildNavIcon(Icons.person, "Profile", 3),
          label: "",
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onItemsTapped,
      elevation: 8,
    );
  }

  Widget _buildNavIcon(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 12 : 0,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isSelected ? secondaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20, // kecilkan icon
            color: isSelected ? Colors.white : Colors.grey,
          ),
          if (isSelected) ...[
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13, // kecilkan teks supaya seimbang
              ),
            ),
          ],
        ],
      ),
    );
  }
}
