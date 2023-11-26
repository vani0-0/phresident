import 'package:flutter/material.dart';

import 'package:phresident/pages/pages.dart';

//For Navigating through pages
abstract class Routes {
  static const home = '/';
  static const about = '/about';
  static const settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomePage(),
    about: (_) => const AboutPage(),
    settings: (_) => const SettingsPage(),
  };
}
