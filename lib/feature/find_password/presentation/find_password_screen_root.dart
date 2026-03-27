import 'package:capstone_2026/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'find_password_screen.dart';
import 'find_password_view_model.dart';

class FindPasswordScreenRoot extends StatefulWidget {
  const FindPasswordScreenRoot({
    super.key,
    required this.viewModel,
  });

  final FindPasswordViewModel viewModel;

  @override
  State<FindPasswordScreenRoot> createState() => _FindPasswordScreenRootState();
}

class _FindPasswordScreenRootState extends State<FindPasswordScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return FindPasswordScreen(
          state: widget.viewModel.state,
          onEmailChanged: widget.viewModel.onEmailChanged,
          onSubmit: widget.viewModel.submitFindPassword,
          onSignInTap: () => context.go(Routes.signIn),
        );
      },
    );
  }
}
