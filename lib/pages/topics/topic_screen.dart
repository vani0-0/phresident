import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:phresident/providers/providers.dart';
import 'package:phresident/customs/customs.dart';
import 'package:phresident/themes/themes.dart';
import 'package:phresident/models/models.dart';
import 'package:phresident/pages/pages.dart';
import 'package:phresident/navigator.dart';

class TopicScreen extends ConsumerWidget {
  const TopicScreen({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    QuizState quizState = ref.watch(quizStateProvider);
    return Scaffold(
      appBar: CustomAppbar(hasLeftIcon: false, title: topic.name),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: quizState.controller,
        onPageChanged: (index) =>
            quizState.progress = (index / (topic.questions.length + 1)),
        itemBuilder: (context, index) {
          if (index == 0) {
            return StartPage(topic: topic);
          } else if (index == topic.questions.length) {
            return CongratsPage(topic: topic);
          } else {
            return QuizPage(question: topic.questions[index - 1]);
          }
        },
      ),
    );
  }
}

class StartPage extends ConsumerWidget {
  const StartPage({
    super.key,
    required this.topic,
  });

  final TopicModel topic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.width / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Profile(topic: topic, height: height),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: spacingL,
                vertical: spacingS,
              ),
              child: Text(
                topic.description,
                style: paragraphM,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingS,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  AppNavigator()
                      .to(context, LessonsListPage(lessons: topic.lessons));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Read'),
              ),
              const SizedBox(height: 8), // Add some space between buttons
              ElevatedButton(
                onPressed: ref.watch(quizStateProvider).nextPage,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Take Quiz'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.topic,
    required this.height,
  });

  final TopicModel topic;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: topic.image,
          child: Image.asset(
            'assets/images/${topic.image}',
            width: MediaQuery.of(context).size.width,
            height: 275,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          top: height,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: spacingL),
                decoration: BoxDecoration(
                  color: Colors.black87.withOpacity(.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child:
                    Text(topic.title, style: headingL.copyWith(color: color60)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CongratsPage extends ConsumerWidget {
  const CongratsPage({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congrats! You completed the ${topic.title} quiz!',
            textAlign: TextAlign.center,
          ),
          const Divider(),
          ElevatedButton.icon(
            icon: const Icon(FontAwesomeIcons.check),
            label: const Text('Mark as Completed!'),
            onPressed: () {
              ref.read(markedAsDoneProvider.notifier).markAsDone(id: topic.id);
              AppNavigator().pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key, required this.question});
  final QuestionModel question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Text(question.text, style: paragraphL),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: question.options
                .map(
                  (option) => Container(
                    height: 90,
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.black26,
                    child: InkWell(
                      onTap: () {
                        ref.watch(quizStateProvider).selected = option;
                        _bottomSheet(
                            context, option, ref.watch(quizStateProvider));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              ref.watch(quizStateProvider).selected == option
                                  ? FontAwesomeIcons.circleCheck
                                  : FontAwesomeIcons.circle,
                              size: 30,
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              child: Text(option.value, style: paragraphS),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  _bottomSheet(BuildContext context, OptionModel option, QuizState state) {
    bool correct = option.correct;

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(correct ? 'Good Job!' : 'Wrong', style: headingS),
            Text(option.detail, style: paragraphS),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: correct ? Colors.green : Colors.red),
              onPressed: () {
                if (correct) {
                  state.nextPage();
                }
                Navigator.pop(context);
              },
              child: Text(
                correct ? 'Onward' : 'Try Again',
                style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
