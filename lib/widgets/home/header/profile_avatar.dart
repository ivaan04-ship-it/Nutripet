
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 24,
      backgroundColor: AppColors.primary,
      child: Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }
}