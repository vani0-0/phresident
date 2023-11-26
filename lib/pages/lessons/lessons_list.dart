import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phresident/customs/appbar/appbar.dart';
import 'package:phresident/models/lesson.model.dart';
import 'package:phresident/navigator.dart';
import 'package:phresident/pages/lessons/read.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

class LessonsListPage extends ConsumerWidget {
  const LessonsListPage({super.key, required this.lessons});

  final List<LessonModel> lessons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    return Column(
      children: lessons.map((lesson) => LessonCard(lesson: lesson)).toList(),
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
              style: headingM,
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
