import 'dart:ui';

import 'package:flutter/material.dart';

import 'bottom_navigation_view_item.dart';

class BottomNavigationView extends StatelessWidget {
  final List<BottomNavigationViewItem> items;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;
  final Color backgroundColor;

  const BottomNavigationView({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.selectedIndex,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            height: 80,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.86),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            height: 80,
            width: 350,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
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
        ],
      ),
    );
  }

  Widget _buildNavItem(BottomNavigationViewItem item, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: isSelected
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            )
          : null,
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
