import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phresident/constants.dart';
import 'package:phresident/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPreferences);
});

class SharedUtility {
  SharedUtility({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  bool isDarkModeEnabled() {
    return sharedPreferences.getBool(darkModeKey) ?? false;
  }

  void setDarkModeEnabled({required bool isdark}) {
    sharedPreferences.setBool(darkModeKey, isdark);
  }

  String getUsername() {
    return sharedPreferences.getString(usernameKey) ?? generateRandomUsername();
  }

  void saveUsername({required String username}) {
    sharedPreferences.setString(usernameKey, username);
  }

  String getAvatar() {
    return sharedPreferences.getString(avatarKey) ?? '';
  }

  void saveAvatar({required String avatar}) {
    sharedPreferences.setString(avatarKey, avatar);
  }

  double getProgress() {
    return sharedPreferences.getDouble(progressKey) ?? 0.00;
  }

  void setProgress({required double progress}) {
    sharedPreferences.setDouble(progressKey, progress);
  }

  List<String> getMarkedAsDone() {
    return sharedPreferences.getStringList(markedAsDoneKey) ?? [];
  }

  void markAsDone({required String id}) {
    List<String> list = sharedPreferences.getStringList(markedAsDoneKey) ?? [];
    list.add(id);
    sharedPreferences.setStringList(markedAsDoneKey, list);
  }

  void reset() {
    sharedPreferences.clear();
  }
}
