import 'package:capstone_2026/core/presentation/component/custom_bottom_app_bar.dart';
import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/di/di_setup.dart';
import 'package:capstone_2026/feature/find_password/presentation/find_password_screen_root.dart';
import 'package:capstone_2026/feature/find_password/presentation/find_password_view_model.dart';
import 'package:capstone_2026/feature/home/presentation/screen/home_screen.dart';
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
              path: Routes.saved,
              builder: (context, state) =>
                  const Placeholder(color: Colors.tealAccent),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.myPage,
              builder: (context, state) =>
                  const Placeholder(color: Colors.green),
            ),
          ],
        ),
      ],
    ),
  ],
);
