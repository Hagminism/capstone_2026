import 'package:capstone_2026/core/presentation/component/app_bar_nav_item.dart';
import 'package:capstone_2026/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomAppBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomBottomAppBar({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: navigationShell,
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(), // 노치 모양 생성
        // notchMargin: 8.0, // 노치와 floatingActionButton 사이의 간격
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 0,
              icon: Icons.calendar_month_outlined,
              label: '캘린더',
            ),
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 1,
              icon: Icons.bar_chart,
              label: '기간별',
            ),
            const SizedBox(width: 24),
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 2,
              icon: Icons.pie_chart_rounded,
              label: '카테고리별',
            ),
            AppBarNavItem(
              navigationShell: navigationShell,
              index: 3,
              icon: Icons.person_outline_outlined,
              label: '마이페이지',
            ),
          ],
        ),
      ),
      // floatingActionButton: (navigationShell.currentIndex == 0)
      //     ? FloatingActionButton(
      //         onPressed: () {},
      //         shape: CircleBorder(),
      //         backgroundColor: AppColors.primary,
      //         child: Icon(
      //           Icons.add,
      //           color: Colors.white,
      //           size: 32,
      //         ),
      //       )
      //     : null,
    );
  }
}
