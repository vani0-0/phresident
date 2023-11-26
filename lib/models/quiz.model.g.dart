// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      text: json['text'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': instance.options,
    };

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) => OptionModel(
      value: json['value'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
      correct: json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$OptionModelToJson(OptionModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'detail': instance.detail,
      'correct': instance.correct,
    };
