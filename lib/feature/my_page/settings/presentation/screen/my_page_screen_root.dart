import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/feature/my_page/settings/presentation/screen/my_page_action.dart';
import 'package:capstone_2026/feature/my_page/settings/presentation/screen/my_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPageScreenRoot extends StatelessWidget {
  const MyPageScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPageScreen(
      onAction: (action) {
        switch (action) {
          case ViewNotifications():
            context.push('${Routes.myPage}/${Routes.notifications}');
            break;
          case EditProfile():
            context.push('${Routes.myPage}/${Routes.profileEdit}');
            break;
          case ViewReservationHistory():
            context.push('${Routes.myPage}/${Routes.reservationHistory}');
            break;
          case ViewReviewHistory():
            context.push('${Routes.myPage}/${Routes.reviewHistory}');
            break;
          case TapAccountSettings():
            context.push('${Routes.myPage}/${Routes.accountSettings}');
            break;
          case TapNotificationSettings():
            context.push('${Routes.myPage}/${Routes.notificationSettings}');
            break;
          case TapInquiry():
            context.push('${Routes.myPage}/${Routes.inquiry}');
            break;
          case ViewNotices():
            context.push('${Routes.myPage}/${Routes.notices}');
            break;
          case ViewTerms():
            context.push('${Routes.myPage}/${Routes.terms}');
            break;
        }
      },
    );
  }
}
