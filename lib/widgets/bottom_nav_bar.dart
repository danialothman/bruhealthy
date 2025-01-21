import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedFontSize: 11.0,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff00cdbc),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.house,
            size: 16,
            color: unselectedIconColor,
          ),
          label: 'Home',
          backgroundColor: const Color(0xff170626),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.solidCalendar,
            size: 16,
            color: unselectedIconColor,
          ),
          label: 'Plan',
          backgroundColor: const Color(0xff170626),
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.health_and_safety,
            size: 32,
          ),
          label: '',
          backgroundColor: Color(0xff170626),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.solidFileLines,
            size: 16,
            color: unselectedIconColor,
          ),
          label: 'Article',
          backgroundColor: const Color(0xff170626),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.solidUser,
            size: 16,
            color: unselectedIconColor,
          ),
          label: 'Me',
          backgroundColor: const Color(0xff170626),
        ),
      ],
    );
  }
}
