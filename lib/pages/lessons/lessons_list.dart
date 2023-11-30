import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:phresident/providers/providers.dart';
import 'package:phresident/customs/customs.dart';
import 'package:phresident/themes/themes.dart';
import 'package:phresident/models/models.dart';
import 'package:phresident/pages/pages.dart';
import 'package:phresident/navigator.dart';

class LessonsListPage extends StatelessWidget {
  const LessonsListPage({super.key, required this.lessons});

  final List<LessonModel> lessons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Lessons', hasLeftIcon: false),
      body: LessonsList(lessons: lessons),
    );
  }
}

class LessonsList extends StatelessWidget {
  const LessonsList({
    super.key,
    required this.lessons,
  });

  final List<LessonModel> lessons;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: lessons.map((lesson) => LessonCard(lesson: lesson)).toList(),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson});

  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: InkWell(
        onTap: () {
          AppNavigator().to(context, ReadPage(lessonId: lesson.id));
        },
        child: Container(
          padding: EdgeInsets.all(spacingS),
          child: ListTile(
            title: Text(
              lesson.title,
              style: headingS,
            ),
            subtitle: Text(
              lesson.description,
              style: paragraphS,
            ),
            leading: LessonBadge(lessonId: lesson.id),
          ),
        ),
      ),
    );
  }
}

class LessonBadge extends ConsumerWidget {
  const LessonBadge({super.key, required this.lessonId});

  final String lessonId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> list = ref.watch(markedAsDoneProvider);
    if (list.contains(lessonId)) {
      return const Icon(
        FontAwesomeIcons.checkDouble,
        color: color10,
      );
    } else {
      return const Icon(
        FontAwesomeIcons.circle,
        color: color10,
      );
    }
  }
}
