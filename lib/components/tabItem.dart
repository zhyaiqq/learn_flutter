import 'package:flutter/material.dart';

class TabItem extends BottomNavigationBarItem {
  TabItem(String icon, String title):
    super(
      icon: Image.asset('assets/images/tabbar/$icon.png', width: 30),
      activeIcon: Image.asset('assets/images/tabbar/${icon}_active.png', width: 30),
      title: Text(title)
    );
}
