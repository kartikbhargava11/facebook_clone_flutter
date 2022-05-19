import 'package:facebook_clone/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import './home_screen.dart';

import '../widgets/custom_tab_bar.dart';
import '../widgets/responsive.dart';
import '../widgets/custom_app_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
          ?
        PreferredSize(
          preferredSize: Size(screenSize.width, 100),
          child: CustomAppBar(
            currentUser: currentUser,
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() { _selectedIndex = index; })
          ),
        )
          :
        null,
        // body: TabBarView(
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: _screens,
        // ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
          ?
        CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() {
              _selectedIndex = index;
            })
        )
          :
        const SizedBox.shrink()
      )
    );
  }
}
