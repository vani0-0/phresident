import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phresident/models/models.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';
import 'avatar.dart';
import 'progress.dart';
import 'status.dart';
import 'username.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel user = ref.watch(userProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingL, vertical: spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ProfileContainer(
            left: UsernameContainer(username: user.username),
            right: AvatarContainer(avatar: user.avatar),
          ),
          const Spacer(),
          const ProfileContainer(
            left: StatusContainer(),
            right: ProgressContainer(),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key, required this.left, required this.right});

  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [left, right],
    );
  }
}
