import 'package:phresident/models/user.model.dart';
import 'package:phresident/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  UserModel build() {
    String usernameData = ref.watch(sharedUtilityProvider).getUsername();
    double progress = ref.watch(sharedUtilityProvider).getProgress();
    return UserModel(username: usernameData, progress: progress);
  }

  void changeUsername({required String newUsername}) {
    ref.watch(sharedUtilityProvider).saveUsername(username: newUsername);
    state = UserModel(
        username: newUsername, avatar: state.avatar, progress: state.progress);
  }

  void changeAvatar({required String newAvatar}) {
    ref.watch(sharedUtilityProvider).saveAvatar(avatar: newAvatar);
    state = UserModel(
        username: state.username, avatar: newAvatar, progress: state.progress);
  }

  void addProgress() {
    ref.watch(sharedUtilityProvider).setProgress(progress: state.progress + 1);
    state = UserModel(
      username: state.username,
      avatar: state.avatar,
      progress: state.progress + 1,
    );
  }

  void reset() {
    ref.watch(sharedUtilityProvider).reset();
    ref.watch(markedAsDoneProvider.notifier).build();
    state = UserModel(username: ref.watch(sharedUtilityProvider).getUsername());
  }
}
