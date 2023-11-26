import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phresident/models/quiz.model.dart';

final quizStateProvider = ChangeNotifierProvider((ref) => QuizState());

class QuizState with ChangeNotifier {
  double _progress = 0;
  OptionModel? _selected;
  final PageController controller = PageController();

  double get progress => _progress;
  OptionModel? get selected => _selected;

  set progress(double value) {
    _progress = value;
    notifyListeners();
  }

  set selected(OptionModel? value) {
    _selected = value;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
