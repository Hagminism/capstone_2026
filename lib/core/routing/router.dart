import 'package:capstone_2026/core/presentation/component/custom_bottom_app_bar.dart';
import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/di/di_setup.dart';
import 'package:capstone_2026/feature/find_password/presentation/find_password_screen_root.dart';
import 'package:capstone_2026/feature/find_password/presentation/find_password_view_model.dart';
import 'package:capstone_2026/feature/home/presentation/screen/home_screen.dart';
import 'package:capstone_2026/feature/my_page/presentation/screen/my_page_screen.dart';
import 'package:capstone_2026/feature/my_page/presentation/screen/edit_profile_screen.dart';
import 'package:capstone_2026/feature/bookmark/presentation/screen/bookmark_screen.dart';
import 'package:capstone_2026/feature/bookmark_store_detail/presentation/screen/bookmark_store_detail_screen.dart';
import 'package:capstone_2026/feature/store_detail/presentation/screen/store_detail_screen.dart';
import 'package:capstone_2026/feature/sign_in/presentation/sign_in_screen_root.dart';
import 'package:capstone_2026/feature/sign_in/presentation/sign_in_view_model.dart';
import 'package:capstone_2026/feature/sign_up_partner/presentation/sign_up_partner_screen_root.dart';
import 'package:capstone_2026/feature/sign_up_partner/presentation/sign_up_partner_view_model.dart';
import 'package:capstone_2026/feature/sign_up/presentation/sign_up_screen_root.dart';
import 'package:capstone_2026/feature/sign_up/presentation/sign_up_view_model.dart';
import 'package:capstone_2026/feature/sign_up_type/presentation/sign_up_type_screen_root.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  initialLocation: Routes.signIn,
  routes: [
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignInScreenRoot(
        viewModel: getIt<SignInViewModel>(),
      ),
      routes: [
        GoRoute(
          path: Routes.findPassword,
          builder: (context, state) => FindPasswordScreenRoot(
            viewModel: getIt<FindPasswordViewModel>(),
          ),
        ),
        GoRoute(
          path: Routes.signUpType,
          builder: (context, state) => const SignUpTypeScreenRoot(),
          routes: [
            GoRoute(
              path: Routes.signUpUser,
              builder: (context, state) => SignUpScreenRoot(
                viewModel: getIt<SignUpViewModel>(),
              ),
            ),
            GoRoute(
              path: Routes.signUpPartner,
              builder: (context, state) => SignUpPartnerScreenRoot(
                viewModel: getIt<SignUpPartnerViewModel>(),
              ),
            ),
          ],
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomBottomAppBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: Routes.storeDetail,
                  builder: (context, state) => StoreDetailScreen(
                    storeId: state.pathParameters['storeId'] ?? '',
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.map,
              builder: (context, state) =>
                  const Placeholder(color: Colors.amberAccent),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.bookmark,
              builder: (context, state) => const BookmarkScreen(),
              routes: [
                GoRoute(
                  path: Routes.bookmarkStoreDetail,
                  builder: (context, state) => BookmarkStoreDetailScreen(
                    storeId: state.pathParameters['storeId'] ?? '',
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.myPage,
              builder: (context, state) => const MyPageScreen(),
              routes: [
                GoRoute(
                  path: Routes.profileEdit,
                  builder: (context, state) => const EditProfileScreen(),
                ),
                GoRoute(
                  path: Routes.reservationHistory,
                  builder: (context, state) => const Scaffold(
                    body: SafeArea(
                      child: Center(child: Text('이용 내역 페이지')),
                    ),
                  ),
                ),
                GoRoute(
                  path: Routes.reviewHistory,
                  builder: (context, state) => const Scaffold(
                    body: SafeArea(
                      child: Center(child: Text('리뷰 내역 페이지')),
                    ),
                  ),
                ),
                GoRoute(
                  path: Routes.notificationSettings,
                  builder: (context, state) => const Scaffold(
                    body: SafeArea(
                      child: Center(child: Text('알림 설정 페이지')),
                    ),
                  ),
                ),
                GoRoute(
                  path: Routes.notices,
                  builder: (context, state) => const Scaffold(
                    body: SafeArea(
                      child: Center(child: Text('공지사항 페이지')),
                    ),
                  ),
                ),
                GoRoute(
                  path: Routes.terms,
                  builder: (context, state) => const Scaffold(
                    body: SafeArea(
                      child: Center(child: Text('이용약관 페이지')),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
