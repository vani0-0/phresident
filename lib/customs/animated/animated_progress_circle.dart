import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:phresident/constants.dart';
import 'package:phresident/models/models.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

import 'animated_count.dart';

class ProgressCircular extends ConsumerWidget {
  const ProgressCircular({super.key});

  final double radius = 60;
  final double lineWidth = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TopicModel> topics = ref.watch(topicsProvider).value ?? [];
    int total = topics.length;

    for (final TopicModel topic in topics) {
      total += topic.lessons.length;
    }
    debugPrint('$total');
    double currentvalue = ref.watch(userProvider).progress;
    debugPrint('$currentvalue');
    double totalValue = currentvalue / total;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, val, child) {
        Color interpolatedColor =
            Color.lerp(Colors.red, _colorGen(totalValue), val) ?? Colors.red;

        return CircularPercentIndicator(
          animation: true,
          animationDuration: oneSecond,
          radius: radius,
          lineWidth: lineWidth,
          percent: totalValue,
          curve: Curves.easeInOut,
          progressColor: interpolatedColor,
          backgroundColor: Colors.black,
          circularStrokeCap: CircularStrokeCap.butt,
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCounter(
                end: totalValue == 0 ? 0.01 : totalValue * 100,
                textStyle: headingL,
                color: interpolatedColor,
              ),
            ],
          ),
        );
      },
    );
  }

  _colorGen(double value) {
    int rbg = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg);
  }
}
