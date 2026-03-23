import 'package:capstone_2026/core/presentation/component/custom_bottom_app_bar.dart';
import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/feature/sign_in/presentation/sign_in_screen_root.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  initialLocation: Routes.signIn,
  routes: [
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => const SignInScreenRoot(),
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
