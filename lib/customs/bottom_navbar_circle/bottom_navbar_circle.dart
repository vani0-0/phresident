import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:circle_nav_bar/circle_nav_bar.dart';

import 'package:phresident/providers/providers.dart';
import 'package:phresident/navigator.dart';
import 'package:phresident/themes/color.dart';

import 'icons.dart';

class BottomNavbarCircle extends ConsumerWidget {
  const BottomNavbarCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeIndex = ref.watch(pageTrackerProvider);

    redirect(int index) {
      if (index == 1) {
        AppNavigator().toAboutPage(context);
      } else if (index == 2) {
        AppNavigator().toSettingsPage(context);
      } else {
        ref.read(pageTrackerProvider.notifier).navigate(index);
      }
    }

    return CircleNavBar(
      activeIndex: activeIndex,
      activeIcons: activeIcons,
      inactiveIcons: inactiveIcons,
      height: kBottomNavigationBarHeight,
      circleWidth: kBottomNavigationBarHeight,
      color: Theme.of(context).primaryColor,
      circleColor: color10,
      onTap: (index) {
        redirect(index);
      },
    );
  }
}
