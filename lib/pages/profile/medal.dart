import 'package:flutter/material.dart';
import 'package:phresident/themes/themes.dart';

class MedalContainer extends StatelessWidget {
  const MedalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 12, crossAxisSpacing: 12),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: color10, offset: Offset(1, 1), spreadRadius: 2)
              ],
              color: color30,
            ),
          );
        },
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
