import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phresident/providers/shared_preference_provider.dart';

final isDarkProvider =
    NotifierProvider<DarkThemeNotifier, bool>(DarkThemeNotifier.new);

class DarkThemeNotifier extends Notifier<bool> {
  @override
  bool build() {
    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
    return state;
  }

  void toggleTheme() {
    bool isDark = ref.read(sharedUtilityProvider).isDarkModeEnabled();
    ref.read(sharedUtilityProvider).setDarkModeEnabled(isdark: !isDark);

    state = !isDark;
  }
}
