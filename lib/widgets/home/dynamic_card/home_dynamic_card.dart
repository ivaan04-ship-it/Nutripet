
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_radius.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_text_styles.dart';

class HomeDynamicCard extends StatelessWidget {
  const HomeDynamicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "💡 Consejo del día",
              style: AppTextStyles.title,
            ),

            const SizedBox(height: AppSpacing.sm),

            const Text(
              "Los primeros ingredientes de un pienso son los más importantes. Si ves cereales antes que carne, merece la pena comparar otras opciones.",
              style: AppTextStyles.body,
            ),

            const SizedBox(height: AppSpacing.md),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("Leer más"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}