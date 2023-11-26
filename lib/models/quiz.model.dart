import 'package:json_annotation/json_annotation.dart';
part 'quiz.model.g.dart';

@JsonSerializable()
class QuestionModel {
  String text;
  List<OptionModel> options;

  QuestionModel({this.text = '', this.options = const []});

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

@JsonSerializable()
class OptionModel {
  String value;
  String detail;
  bool correct;

  OptionModel({
    this.value = '',
    this.detail = '',
    this.correct = false,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
