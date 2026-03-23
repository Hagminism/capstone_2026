import 'package:flutter/material.dart';

import 'sign_in_screen.dart';
import 'sign_in_view_model.dart';

class SignInScreenRoot extends StatefulWidget {
  const SignInScreenRoot({super.key});

  @override
  State<SignInScreenRoot> createState() => _SignInScreenRootState();
}

class _SignInScreenRootState extends State<SignInScreenRoot> {
  late final SignInViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SignInViewModel();
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
        return SignInScreen(
          state: _viewModel.state,
          onEmailChanged: _viewModel.onEmailChanged,
          onPasswordChanged: _viewModel.onPasswordChanged,
          onSubmit: _viewModel.submitLogin,
        );
      },
    );
  }
}
