import 'package:flutter/material.dart';
import 'package:phresident/routes.dart';

//Singleton Approach
class AppNavigator {
  factory AppNavigator() {
    return _instance;
  }
  AppNavigator._();
  static final AppNavigator _instance = AppNavigator._();

  //Back <<-
  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  //To ->>
  void toSettingsPage(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.settings);
  }

  void toAboutPage(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.about);
  }

  void to(BuildContext context, Widget to) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => to));
  }
}
