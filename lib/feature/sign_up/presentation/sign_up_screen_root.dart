import 'package:capstone_2026/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_screen.dart';
import 'sign_up_view_model.dart';

class SignUpScreenRoot extends StatefulWidget {
  const SignUpScreenRoot({super.key});

  @override
  State<SignUpScreenRoot> createState() => _SignUpScreenRootState();
}

class _SignUpScreenRootState extends State<SignUpScreenRoot> {
  late final SignUpViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SignUpViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return SignUpScreen(
          state: _viewModel.state,
          onNameChanged: _viewModel.onNameChanged,
          onEmailChanged: _viewModel.onEmailChanged,
          onPasswordChanged: _viewModel.onPasswordChanged,
          onPasswordConfirmChanged: _viewModel.onPasswordConfirmChanged,
          onTermsChanged: _viewModel.onTermsChanged,
          onSubmit: _viewModel.submitSignUp,
          onSignInTap: () => context.go(Routes.signIn),
        );
      },
    );
  }
}
