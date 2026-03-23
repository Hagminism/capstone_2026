import 'package:capstone_2026/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_screen.dart';
import 'sign_up_view_model.dart';

class SignUpScreenRoot extends StatefulWidget {
  final SignUpViewModel viewModel;

  const SignUpScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SignUpScreenRoot> createState() => _SignUpScreenRootState();
}

class _SignUpScreenRootState extends State<SignUpScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SignUpScreen(
          state: widget.viewModel.state,
          onNameChanged: widget.viewModel.onNameChanged,
          onEmailChanged: widget.viewModel.onEmailChanged,
          onPasswordChanged: widget.viewModel.onPasswordChanged,
          onPasswordConfirmChanged: widget.viewModel.onPasswordConfirmChanged,
          onTermsChanged: widget.viewModel.onTermsChanged,
          onSubmit: widget.viewModel.submitSignUp,
          onSignInTap: () => context.go(Routes.signIn),
        );
      },
    );
  }
}
