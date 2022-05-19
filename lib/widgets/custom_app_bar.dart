import 'package:facebook_clone/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

import '../models/user.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          )
        ]
      ),
      child: Row(
        children: [
          const Text(
            "facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            )
          ),
          Container(
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap
            ),
          )

        ],
      )
    );
  }
}
