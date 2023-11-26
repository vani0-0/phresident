import 'package:json_annotation/json_annotation.dart';
import 'package:phresident/models/lesson.model.dart';

import 'quiz.model.dart';

part 'topic.model.g.dart';

@JsonSerializable()
class TopicModel {
  late final String id;
  final String title;
  final String name;
  final String image;
  final String description;
  final List<LessonModel> lessons;
  List<QuestionModel> questions;

  TopicModel({
    this.id = '',
    this.image = 'default.png',
    this.title = '',
    this.name = '',
    this.description = '',
    this.lessons = const [],
    this.questions = const [],
  });

  //Convert json to Topic Model
  factory TopicModel.fromJson(Map<String, dynamic> json) =>
      _$TopicModelFromJson(json);

  //Convert Topic model to json
  Map<String, dynamic> toJson() => _$TopicModelToJson(this);
}
