import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../shared/components/colors/constants.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: mainColor,
      unselectedItemColor: iconColor,
      backgroundColor: Colors.white,
      elevation: 2,
      iconSize: 24,
      selectedLabelStyle:
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      unselectedLabelStyle:
      const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(IconBroken.Home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              IconBroken.Video,
            ),
            label: 'My Exams'),
        BottomNavigationBarItem(
            icon: Icon(
              IconBroken.Profile,
            ),
            label: 'Profile'),
      ],
    );
  }
}
