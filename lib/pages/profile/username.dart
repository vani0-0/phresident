import 'package:flutter/material.dart';
import 'package:phresident/themes/themes.dart';

class UsernameContainer extends StatelessWidget {
  const UsernameContainer({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: spacingS, right: spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('USERNAME:', style: headingL),
            Padding(
              padding: EdgeInsets.only(top: spacingS),
              child: Text(username, style: headingM),
            ),
          ],
        ),
      ),
    );
  }
}
