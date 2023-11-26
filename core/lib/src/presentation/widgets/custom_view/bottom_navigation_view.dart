import 'package:flutter/material.dart';
import 'styles.dart';

class BottomNavigationView extends StatelessWidget {
  final double? height;
  final double? width;
  final List<BottomNavigationViewItem> items;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;
  final Color backgroundColor;

  const BottomNavigationView({
    super.key,
    this.height,
    this.width,
    required this.items,
    required this.onItemSelected,
    required this.selectedIndex,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 15.0),
      height: height,
      duration: Styles.animationDuration,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(Styles.appRadius)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) => GestureDetector(
              onTap: () => onItemSelected(index),
              child: _buildNavItem(items[index], index == selectedIndex),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BottomNavigationViewItem item, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon,
            color: isSelected ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 4.0),
          Text(
            item.label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationViewItem {
  final IconData icon;
  final String label;

  BottomNavigationViewItem({required this.icon, required this.label});
}
