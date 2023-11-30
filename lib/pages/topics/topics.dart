import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:phresident/models/models.dart';

import 'package:phresident/pages/topics/topic_item.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

//Displays all the topics on the page.
class TopicsPage extends ConsumerWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TopicModel>> topicsData = ref.watch(topicsProvider);

    return topicsData.when(
      data: (topics) => GridView.count(
        primary: false,
        padding: EdgeInsets.all(spacingM),
        mainAxisSpacing: spacingS,
        crossAxisSpacing: spacingS,
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.3),
        children: topics.map((topic) => TopicItem(topic: topic)).toList(),
      ),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
