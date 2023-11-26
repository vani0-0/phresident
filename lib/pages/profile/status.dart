import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phresident/providers/lessons_provider.dart';
import 'package:phresident/themes/themes.dart';

class StatusContainer extends ConsumerWidget {
  const StatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lessons = ref.watch(markedAsDoneProvider).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Medals: ', style: headingL),
        const Divider(),
        Text('Quiz: ', style: headingS),
        Text('                      $lessons / 6', style: paragraphM),
        Text('Topic: ', style: headingS),
        Text('                      1 / 6', style: paragraphM),
      ],
    );
  }
}
