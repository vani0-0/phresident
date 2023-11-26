import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:phresident/models/topic.model.dart';
part 'topics_provider.g.dart';

@riverpod
class Topics extends _$Topics {
  @override
  FutureOr<List<TopicModel>> build() async {
    final jsonData = await rootBundle.loadString('assets/data/topics.json');
    final List<dynamic> jsonList = jsonDecode(jsonData);
    final List<TopicModel> topics =
        jsonList.map((json) => TopicModel.fromJson(json)).toList();

    return topics;
  }
}
