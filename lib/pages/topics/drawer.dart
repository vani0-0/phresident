import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';
import 'package:phresident/models/models.dart';
import 'package:phresident/pages/pages.dart';

class TopicDrawer extends ConsumerWidget {
  const TopicDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TopicModel>> topicsData = ref.watch(topicsProvider);
    return topicsData.when(
      data: (topics) => Drawer(
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (_, index) {
            TopicModel topic = topics.elementAt(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: spacingS, left: spacingS),
                  child: Text(topic.title, style: headingS),
                ),
                LessonsList(lessons: topic.lessons),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
