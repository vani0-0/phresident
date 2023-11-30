import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    super.key,
    required this.end,
    required this.textStyle,
    required this.color,
  });

  final double begin = 0;
  final double end;
  final TextStyle textStyle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: begin, end: end),
      builder: (context, val, child) {
        Color interpolatedColor =
            Color.lerp(Colors.red, color, val / end) ?? Colors.red;
        return Text(
          '${val.toStringAsFixed(1)}%',
          style: textStyle.copyWith(color: interpolatedColor),
        );
      },
    );
  }
}
