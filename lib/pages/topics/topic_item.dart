import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phresident/models/models.dart';
import 'package:phresident/navigator.dart';
import 'package:phresident/pages/pages.dart';
import 'package:phresident/providers/lessons_provider.dart';
import 'package:phresident/themes/themes.dart';

class TopicItem extends StatelessWidget {
  const TopicItem({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.image,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(),
        ),
        child: InkWell(
          onTap: () {
            AppNavigator().to(context, TopicScreen(topic: topic));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/images/${topic.image}',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: spacingS, right: spacingS),
                child: Text(
                  topic.name,
                  style: headingS,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
              Progressbar(lessons: topic.lessons),
            ],
          ),
        ),
      ),
    );
  }
}

class Progressbar extends ConsumerWidget {
  const Progressbar({super.key, required this.lessons});

  final List<LessonModel> lessons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> completed = ref.watch(markedAsDoneProvider);
    int lessonCount = 0;
    for (LessonModel lesson in lessons) {
      if (completed.contains(lesson.id)) {
        lessonCount++;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: spacingS),
          child: const Text('Lesson'),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: spacingS),
              child: Text('$lessonCount / ${lessons.length}'),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(spacingS),
                child: LinearProgressIndicator(
                  value: lessonCount / lessons.length,
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  minHeight: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
