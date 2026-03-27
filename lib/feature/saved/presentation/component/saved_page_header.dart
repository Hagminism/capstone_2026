import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/text_styles.dart';
import 'package:flutter/material.dart';

class SavedPageHeader extends StatelessWidget {
  const SavedPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '저장한 업장',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '북마크한 업장을 한눈에 확인해보세요.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
