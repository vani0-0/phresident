import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageTrackerProvider = NotifierProvider<PageTracker, int>(PageTracker.new);

class PageTracker extends Notifier<int> {
  @override
  build() => 0;

  navigate(int page) {
    state = page;
  }
}
