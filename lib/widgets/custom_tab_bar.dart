import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(top: BorderSide(color: Palette.facebookBlue, width: 3.0))
      ),
      tabs: icons.asMap().map((index, icon) {
        return MapEntry(index, Tab(
          icon: Icon(
            icon,
            size: 30.0,
            color: index == selectedIndex ? Palette.facebookBlue : Colors.black45,
          ),
        ));
      }).values.toList()
    );
  }
}
