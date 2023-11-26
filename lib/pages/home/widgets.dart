import 'package:flutter/material.dart';

import 'package:phresident/pages/pages.dart';
import 'package:phresident/customs/customs.dart';

List<Widget?> bodies = [const TopicsPage(), null, null, const ProfilePage()];
List<PreferredSizeWidget?> appbars = [
  const CustomAppbar(title: 'Topics', hasLeftIcon: true),
  null,
  null,
  const CustomAppbar(title: 'Profile', hasLeftIcon: false),
];
