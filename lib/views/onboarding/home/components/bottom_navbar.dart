import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';

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
          icon: _buildNavIcon(Icons.car_crash, "Wishlist", 1),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              _buildNavIcon(Icons.favorite, "Setting", 2),
              // contoh badge
              if (selectedIndex != 2)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 12 : 0,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
          ),
          if (isSelected) ...[
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
