import 'package:flutter/material.dart';

import '../entities/bottom_navigtion_bar_entity.dart';
import '../helper/app_theme_helper.dart';
import 'bottom_naviagtion_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedItem = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: theme.colors.white,
        boxShadow: [
          BoxShadow(
            color: theme.colors.grey0,
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getBottomNavigtionBarEntity.asMap().entries.map((entry) {
          final index = entry.key;
          final value = entry.value;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = index;
                });
              },
              child: BottomNavigationBarItems(
                bottomNavigtionBarEntity: value,
                isSelected: selectedItem == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
