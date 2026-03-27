import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarNavItem extends StatelessWidget {
  final StatefulNavigationShell navigationShell; // index 따오고 goBranch 하기 위해
  final int index; // 각 버튼의 인덱스 저장
  final IconData icon; // 설정할 아이콘
  final String label; // 설정할 라벨

  const AppBarNavItem({
    super.key,
    required this.navigationShell,
    required this.index,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: InkWell(
        onTap: () => navigationShell.goBranch(
          index,
          initialLocation: (navigationShell.currentIndex == index),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: (navigationShell.currentIndex == index)
                  ? AppColors.primary
                  : const Color(0xFF9CA3AF),
              size: 28,
            ),
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: (navigationShell.currentIndex == index)
                    ? AppColors.primary
                    : const Color(0xFF9CA3AF),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
