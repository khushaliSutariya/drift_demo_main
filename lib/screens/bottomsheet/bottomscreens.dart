import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:drift_demo_main/screens/bottomsheet/firstbottomscreens.dart';
import 'package:drift_demo_main/screens/bottomsheet/secondbottomscreens.dart';
import 'package:drift_demo_main/screens/bottomsheet/valuechangescreens.dart';
import 'package:flutter/material.dart';

import 'lastbottomscreens.dart';

class BottomScreens extends StatefulWidget {
  BottomScreens({
    super.key,
  });

  @override
  State<BottomScreens> createState() => _BottomScreensState();
}

class _BottomScreensState extends State<BottomScreens> {
  int selectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.ease);
    });
  }

  void onTapValueChanged(int value) {
    setState(() {
      selectedIndex = value;
      pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          ValueChangeScreens(
            tap: (value) {
              onTapValueChanged(value);
            },
          ),
          FirstBottomScreens(tap: onItemTapped),
          const SecondBottomScreens(),
          const LastBottomScreens(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffFA5075),
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xffFDB1C0),
        iconSize: 30.0,
        onTap: (index) {
          onItemTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '')
        ],
      ),
    );
  }
}
