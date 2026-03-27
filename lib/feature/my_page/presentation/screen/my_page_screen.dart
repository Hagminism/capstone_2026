import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/feature/my_page/presentation/component/my_menu_section.dart';
import 'package:capstone_2026/feature/my_page/presentation/component/my_menu_tile.dart';
import 'package:capstone_2026/feature/my_page/presentation/component/my_page_header.dart';
import 'package:capstone_2026/feature/my_page/presentation/component/my_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyPageHeader(
                onNotificationTap: () => _showSoonMessage(
                  context,
                  '알림 화면은 다음 스텝에서 연결할 예정입니다.',
                ),
              ),
              const SizedBox(height: 16),
              MyProfileCard(
                name: '이학민님',
                email: 'hakmin@example.com',
                onEditTap: () => context.go('${Routes.myPage}/${Routes.profileEdit}'),
              ),
              const SizedBox(height: 20),
              MyMenuSection(
                title: '내 활동',
                children: [
                  MyMenuTile(
                    title: '이용 내역',
                    icon: Icons.history_rounded,
                    onTap: () => context.go(
                      '${Routes.myPage}/${Routes.reservationHistory}',
                    ),
                  ),
                  MyMenuTile(
                    title: '리뷰 내역',
                    icon: Icons.rate_review_outlined,
                    onTap: () => context.go(
                      '${Routes.myPage}/${Routes.reviewHistory}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MyMenuSection(
                title: '설정 및 안내',
                children: [
                  MyMenuTile(
                    title: '알림 설정',
                    icon: Icons.notifications_active_outlined,
                    onTap: () => context.go(
                      '${Routes.myPage}/${Routes.notificationSettings}',
                    ),
                  ),
                  MyMenuTile(
                    title: '1:1 문의',
                    icon: Icons.mail_outline_rounded,
                    onTap: () => _showSoonMessage(
                      context,
                      '1:1 문의 기능은 다음 스텝에서 연결할 예정입니다.',
                    ),
                  ),
                  MyMenuTile(
                    title: '공지사항',
                    icon: Icons.campaign_outlined,
                    onTap: () => context.go('${Routes.myPage}/${Routes.notices}'),
                  ),
                  MyMenuTile(
                    title: '이용약관',
                    icon: Icons.description_outlined,
                    onTap: () => context.go('${Routes.myPage}/${Routes.terms}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSoonMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }
}
