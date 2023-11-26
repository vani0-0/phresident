import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phresident/models/models.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

import 'avatar.dart';
import 'medal.dart';
import 'progress.dart';
import 'status.dart';
import 'username.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel user = ref.watch(userProvider);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: spacingL, vertical: spacingM),
      children: <Widget>[
        ProfileContainer(
          left: UsernameContainer(username: user.username),
          right: AvatarContainer(avatar: user.avatar),
        ),
        const Divider(),
        Text('Medals: ', style: headingL),
        const MedalContainer(),
        const Divider(),
        ProfileContainer(
          left: const StatusContainer(),
          right: ProgressContainer(progress: user.progress),
        ),
      ],
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
