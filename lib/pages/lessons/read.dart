import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phresident/customs/appbar/appbar.dart';
import 'package:phresident/models/lesson.model.dart';
import 'package:phresident/providers/lessons_provider.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

class ReadPage extends ConsumerWidget {
  const ReadPage({super.key, required this.lessonId});

  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<LessonModel>(
      future: ref.watch(lessonsProvider.notifier).getLesson(lessonId: lessonId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          LessonModel lesson = snapshot.data!;
          return Scaffold(
            appBar: CustomAppbar(
              hasLeftIcon: false,
              title: lesson.title,
              hasRightIcon: false,
            ),
            body: ListView(
              children: [
                Image.asset(
                  'assets/images/${lesson.image}',
                ),
                Container(
                  padding: EdgeInsets.only(top: spacingL, left: spacingM),
                  child: Text(
                    lesson.title,
                    style: headingM,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: spacingM, vertical: spacingS),
                  margin: const EdgeInsets.only(bottom: 80),
                  child: Text(
                    lesson.description,
                    style: paragraphM,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: ref.watch(markedAsDoneProvider).contains(lessonId)
                  ? const Icon(FontAwesomeIcons.checkDouble)
                  : const Icon(FontAwesomeIcons.circle),
              label: const Text('Mark as Done'),
              onPressed: () {
                if (!ref.read(markedAsDoneProvider).contains(lessonId)) {
                  ref
                      .read(markedAsDoneProvider.notifier)
                      .markAsDone(id: lessonId);
                }
              },
            ),
          );
        } else {
          return const Center(
            child: Text('AN Error occured'),
          );
        }
      },
    );
  }
}
