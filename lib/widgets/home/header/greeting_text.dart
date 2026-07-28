
import 'package:flutter/material.dart';

import '../../../theme/app_text_styles.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '👋 Buenos días',
          style: AppTextStyles.subtitle,
        ),
        SizedBox(height: 4),
        Text(
          'Nutripet',
          style: AppTextStyles.headlineMedium,
        ),
        SizedBox(height: 4),
        Text(
          'Tu guía para alimentar mejor a tu mascota',
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}