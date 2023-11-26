import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:phresident/constants.dart';
import 'package:phresident/models/lesson.model.dart';
import 'package:phresident/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lessons_provider.g.dart';

@riverpod
class Lessons extends _$Lessons {
  @override
  FutureOr<List<LessonModel>> build() async {
    final jsonString = await rootBundle.loadString(lessonPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final List<LessonModel> lessons =
        jsonList.map((data) => LessonModel.fromJson(data)).toList();

    return lessons;
  }

  Future<LessonModel> getLesson({required String lessonId}) async {
    final jsonString = await rootBundle.loadString(lessonPath);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final LessonModel lesson = jsonList
        .map((data) => LessonModel.fromJson(data))
        .firstWhere((element) => element.id == lessonId);

    debugPrint('lesson title: ${lesson.title}');

    return lesson;
  }
}

final markedAsDoneProvider =
    NotifierProvider<MarkedAsDone, List<String>>(MarkedAsDone.new);

class MarkedAsDone extends Notifier<List<String>> {
  @override
  List<String> build() {
    state = ref.watch(sharedUtilityProvider).getMarkedAsDone();
    return state;
  }

  void markAsDone({required String id}) {
    List<String> list = ref.read(sharedUtilityProvider).getMarkedAsDone();
    ref.read(sharedUtilityProvider).markAsDone(id: id);
    ref.read(userProvider.notifier).addProgress();
    list.add(id);
    state = list;
  }
}
