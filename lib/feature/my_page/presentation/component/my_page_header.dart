import 'package:capstone_2026/ui/app_colors.dart';
import 'package:flutter/material.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({
    required this.onNotificationTap,
    super.key,
  });

  final VoidCallback onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            '마이페이지',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton.filledTonal(
          onPressed: onNotificationTap,
          icon: const Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}
