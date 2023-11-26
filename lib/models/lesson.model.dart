import 'package:json_annotation/json_annotation.dart';

part 'lesson.model.g.dart';

@JsonSerializable()
class LessonModel {
  String id;
  String title;
  String description;
  String image;

  LessonModel({
    this.id = '',
    this.title = '',
    this.description = '',
    this.image = 'default.png',
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}
