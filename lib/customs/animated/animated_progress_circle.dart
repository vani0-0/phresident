import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phresident/constants.dart';
import 'package:phresident/themes/themes.dart';
import 'animated_count.dart';

class ProgressCircular extends StatelessWidget {
  const ProgressCircular({super.key, required this.progress});

  final double progress;
  final double radius = 60;
  final double lineWidth = 12;

  @override
  Widget build(BuildContext context) {
    double currentvalue = progress + .01;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, val, child) {
        Color interpolatedColor = Color.lerp(
              Colors.red,
              _colorGen(currentvalue / 100),
              val,
            ) ??
            Colors.red;

        return CircularPercentIndicator(
          animation: true,
          animationDuration: oneSecond,
          radius: radius,
          lineWidth: lineWidth,
          percent: currentvalue / 100,
          curve: Curves.easeInOut,
          progressColor: interpolatedColor,
          backgroundColor: Colors.black,
          circularStrokeCap: CircularStrokeCap.butt,
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCounter(
                end: currentvalue,
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
