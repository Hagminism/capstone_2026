import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/text_styles.dart';
import 'package:flutter/material.dart';

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({
    required this.name,
    required this.email,
    required this.onEditTap,
    super.key,
  });

  final String name;
  final String email;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.person_outline_rounded),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.body),
                const SizedBox(height: 2),
                Text(email, style: AppTextStyles.subtitle),
              ],
            ),
          ),
          TextButton(
            onPressed: onEditTap,
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }
}
