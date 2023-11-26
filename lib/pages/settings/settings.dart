import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phresident/customs/customs.dart';
import 'package:phresident/navigator.dart';
import 'package:phresident/providers/theme_provider.dart';
import 'package:phresident/providers/user_provider.dart';
import 'package:phresident/themes/themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppNavigator().pop(context);
        return false;
      },
      child: Scaffold(
        appBar: const CustomAppbar(
            title: 'Settings', hasLeftIcon: false, hasRightIcon: false),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingM,
          ),
          children: [
            Text('Account', style: headingM),
            const ChangeName(),
            const Divider(),
            Text('Theme', style: headingM),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.moon,
                  fill: 1,
                ),
                Text(
                  ' Switch to Darkmode',
                  style: paragraphM,
                ),
                const DarkMode(),
              ],
            ),
            const Divider(),
            const ResetButton()
          ],
        ),
      ),
    );
  }
}

class ResetButton extends ConsumerWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(userProvider.notifier).reset();
      },
      child: Text(
        'Reset',
        style: paragraphM.copyWith(color: Colors.redAccent),
      ),
    );
  }
}

class DarkMode extends ConsumerWidget {
  const DarkMode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: Switch(
            value: ref.watch(isDarkProvider),
            onChanged: (_) {
              ref.read(isDarkProvider.notifier).toggleTheme();
            }),
      ),
    );
  }
}

class ChangeName extends ConsumerWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var username = ref.watch(userProvider).username;

    var textController = TextEditingController(text: username);

    saveUsername() {
      ref
          .read(userProvider.notifier)
          .changeUsername(newUsername: textController.text);

      AppNavigator().pop(context);
    }

    return Container(
      padding: EdgeInsets.only(left: spacingS),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(username),
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              showEditModal(context, textController, saveUsername);
            },
          )
        ],
      ),
    );
  }

  showEditModal(BuildContext context, TextEditingController textController,
      Function saveUsername) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Edit Username',
          style: headingS,
          textAlign: TextAlign.center,
        ),
        content: TextFormField(
          controller: textController, // Add this line to bind the controller
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
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
          TextButton(
            onPressed: () => saveUsername(),
            child: Text(
              'Change',
              style: paragraphS,
            ),
          ),
        ],
      ),
    );
  }
}
