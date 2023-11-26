import 'package:flutter/material.dart';
import 'package:phresident/customs/customs.dart';
import 'package:phresident/themes/themes.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: color30,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: color10, offset: Offset(1, 1), spreadRadius: 2)
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: spacingM, horizontal: spacingS),
      child: Column(
        children: [
          ProgressCircular(progress: progress),
          Text(
            'Completed!',
            style: headingM.copyWith(color: color60),
          )
        ],
      ),
    );
  }
}
