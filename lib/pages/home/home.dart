import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phresident/customs/customs.dart';
import 'package:phresident/pages/pages.dart';
import 'package:phresident/providers/providers.dart';

import 'widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selected = ref.watch(pageTrackerProvider);
    return Scaffold(
      appBar: appbars.elementAt(selected),
      body: bodies.elementAt(selected),
      bottomNavigationBar: const BottomNavbarCircle(),
      drawer: selected == 0 ? const TopicDrawer() : null,
    );
  }
}
