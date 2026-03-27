import 'package:capstone_2026/core/presentation/component/custom_bottom_app_bar.dart';
import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/di/di_setup.dart';
import 'package:capstone_2026/feature/sign_in/presentation/sign_in_screen_root.dart';
import 'package:capstone_2026/feature/sign_in/presentation/sign_in_view_model.dart';
import 'package:capstone_2026/feature/sign_up/presentation/sign_up_screen_root.dart';
import 'package:capstone_2026/feature/sign_up/presentation/sign_up_view_model.dart';
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
    ),
    GoRoute(
      path: Routes.signUp,
      routes: [
        GoRoute(
          path: Routes.signUpType,
          builder: (context, state) => const Scaffold(
            body: Placeholder(),
          ),
          routes: [
            GoRoute(
              path: Routes.signUpUser,
              builder: (context, state) => SignUpScreenRoot(
                viewModel: getIt<SignUpViewModel>(),
              ),
            ),
            GoRoute(
              path: Routes.signUpPartner,
              builder: (context, state) => const Scaffold(
                body: Placeholder(),
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
              builder: (context, state) => const Placeholder(color: Colors.red),
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
