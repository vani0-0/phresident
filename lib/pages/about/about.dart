import 'package:flutter/material.dart';
import 'package:phresident/customs/appbar/appbar.dart';
import 'package:phresident/navigator.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppNavigator().pop(context);
        return false;
      },
      child: Scaffold(
        appBar: const CustomAppbar(
            title: 'About', hasLeftIcon: false, hasRightIcon: false),
        body: Container(
          child: const Center(child: Text('About')),
        ),
      ),
    );
  }
}
