import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phresident/navigator.dart';
import 'package:phresident/providers/providers.dart';
import 'package:phresident/themes/themes.dart';

class AvatarContainer extends ConsumerWidget {
  const AvatarContainer({super.key, required this.avatar});

  final String avatar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void updateProfile(String avatar) {
      ref.watch(userProvider.notifier).changeAvatar(newAvatar: '$avatar.png');
      AppNavigator().pop(context);
    }

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(spacingS),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            boxShadow: const <BoxShadow>[
              BoxShadow(color: color10, offset: Offset(1, 2), spreadRadius: 2)
            ],
            color: color30,
          ),
          child: Image.asset(
            'assets/avatars/$avatar',
            fit: BoxFit.cover,
            scale: 1.2,
          ),
        ),
        Positioned(
          bottom: -10.0,
          right: -10.0,
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.red,
            ),
            onPressed: () {
              showEditModal(context, updateProfile);
            },
          ),
        ),
      ],
    );
  }

  showEditModal(BuildContext context, Function update) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Edit Avatar',
          style: headingS.copyWith(color: color30),
          textAlign: TextAlign.center,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: TextButton(
                onPressed: () => update('boy-1'),
                child: Ink.image(
                  image: const AssetImage('assets/avatars/boy-1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: TextButton(
                onPressed: () => update('girl-1'),
                child: Ink.image(
                  image: const AssetImage('assets/avatars/girl-1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              AppNavigator().pop(context);
            },
            child: Text(
              'Cancel',
              style: paragraphS.copyWith(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
