import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phresident/themes/themes.dart';

List<Widget> activeIcons = [
  const Icon(FontAwesomeIcons.graduationCap),
  const Icon(FontAwesomeIcons.circleQuestion),
  const Icon(FontAwesomeIcons.gear),
  const Icon(FontAwesomeIcons.circleUser),
];

List<Widget> inactiveIcons = [
  const NavbarButtons(label: 'Topics', icon: FontAwesomeIcons.graduationCap),
  const NavbarButtons(label: 'About', icon: FontAwesomeIcons.circleQuestion),
  const NavbarButtons(label: 'Settings', icon: FontAwesomeIcons.gear),
  const NavbarButtons(label: 'Profile', icon: FontAwesomeIcons.circleUser),
];

class NavbarButtons extends StatelessWidget {
  const NavbarButtons({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
        ),
        Text(label, style: paragraphS),
      ],
    );
  }
}
