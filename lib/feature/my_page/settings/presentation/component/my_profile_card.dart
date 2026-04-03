import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class MyProfileCard extends StatelessWidget {
  final String? name;
  final String? email;
  final String? photoUrl;
  final void Function() onTap;

  const MyProfileCard({
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.onTap,
    super.key,
  });

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
            child: (photoUrl == null)
                ? const Icon(Icons.person_outline_rounded)
                : ClipOval(child: Image.network(photoUrl!)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${name ?? ''} 님',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  email ?? '',
                  style: AppTextStyles.caption.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }
}
