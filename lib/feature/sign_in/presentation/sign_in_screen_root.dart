import 'package:capstone_2026/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_in_screen.dart';
import 'sign_in_view_model.dart';

class SignInScreenRoot extends StatefulWidget {
  final SignInViewModel viewModel;

  const SignInScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<SignInScreenRoot> createState() => _SignInScreenRootState();
}

class _SignInScreenRootState extends State<SignInScreenRoot> {
  Future<void> _onSubmit() async {
    final success = await widget.viewModel.submitLogin();
    if (!mounted) {
      return;
    }
    if (success) {
      context.go(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SignInScreen(
          state: widget.viewModel.state,
          onEmailChanged: widget.viewModel.onEmailChanged,
          onPasswordChanged: widget.viewModel.onPasswordChanged,
          onSubmit: _onSubmit,
          onSignUpTap: () => context.go('${Routes.signIn}/${Routes.signUpType}'),
          onFindPasswordTap: () =>
              context.go('${Routes.signIn}/${Routes.findPassword}'),
        );
      },
    );
  }
}
