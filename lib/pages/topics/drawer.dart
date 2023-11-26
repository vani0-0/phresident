import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phresident/models/topic.model.dart';
import 'package:phresident/pages/lessons/lessons_list.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

class TopicDrawer extends ConsumerWidget {
  const TopicDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var topicsData = ref.watch(topicsProvider);
    return topicsData.when(
      data: (topics) => Drawer(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (context, index) {
            TopicModel topic = topics.elementAt(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    topic.title,
                    style: headingS,
                  ),
                ),
                LessonsList(lessons: topic.lessons),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      error: (error, stackTrace) => Text('$error'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
