import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phresident/models/models.dart';

import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

class StatusContainer extends ConsumerWidget {
  const StatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> done = ref.watch(markedAsDoneProvider);
    List<TopicModel> topics = ref.watch(topicsProvider).value ?? [];
    int lessons = 0, quiz = 0, totalLesson = 0;

    for (final TopicModel topic in topics) {
      for (final LessonModel lesson in topic.lessons) {
        totalLesson++;
        if (done.contains(lesson.id)) {
          lessons++;
        }
      }
      if (done.contains(topic.id)) {
        quiz++;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Medals: ', style: headingL),
        const Divider(),
        Text('Lesson: ', style: headingS),
        Text('                  $lessons / $totalLesson', style: paragraphM),
        Text('Quiz: ', style: headingS),
        Text('                  $quiz / ${topics.length}', style: paragraphM),
      ],
    );
  }
}
