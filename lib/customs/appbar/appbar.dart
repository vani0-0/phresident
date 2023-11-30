import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:phresident/custom_icons_icons.dart';
import 'package:phresident/navigator.dart';
import 'package:phresident/themes/themes.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.hasLeftIcon,
    this.hasRightIcon = true,
  });

  final String title;
  final bool hasLeftIcon;
  final bool hasRightIcon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black26,
      elevation: 4,
      centerTitle: true,
      leading: hasLeftIcon
          ? IconButton(
              onPressed: () {
                return Scaffold.of(context).openDrawer();
              },
              icon: const Icon(CustomIcons.menu),
            )
          : null,
      title: Text(title, style: headingL),
      actions: [
        hasRightIcon
            ? IconButton(
                onPressed: () {},
                icon: IconButton(
                  onPressed: () {
                    //Display About page
                    AppNavigator().toAboutPage(context);
                  },
                  icon: const Icon(FontAwesomeIcons.circleQuestion),
                ),
              )
            : Container()
      ],
    );
  }
}
