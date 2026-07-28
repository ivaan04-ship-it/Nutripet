
import 'package:flutter/material.dart';

import '../../../theme/app_spacing.dart';
import 'greeting_text.dart';
import 'profile_avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GreetingText(),
          ),
          ProfileAvatar(),
        ],
      ),
    );
  }
}