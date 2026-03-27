import 'package:capstone_2026/ui/app_colors.dart';
import 'package:flutter/material.dart';

class BookmarkEmptyState extends StatelessWidget {
  const BookmarkEmptyState({
    required this.onExploreTap,
    super.key,
  });

  final VoidCallback onExploreTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.bookmark_border_rounded,
            size: 40,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 10),
          const Text(
            '저장한 업장이 없습니다.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '관심 있는 업장을 저장해두고 빠르게 확인해보세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 14),
          OutlinedButton(
            onPressed: onExploreTap,
            child: const Text('업장 둘러보기'),
          ),
        ],
      ),
    );
  }
}
