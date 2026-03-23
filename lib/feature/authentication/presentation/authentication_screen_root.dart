import 'package:flutter/material.dart';

import 'authentication_screen.dart';
import 'authentication_view_model.dart';

class AuthenticationScreenRoot extends StatefulWidget {
  const AuthenticationScreenRoot({super.key});

  @override
  State<AuthenticationScreenRoot> createState() => _AuthenticationScreenRootState();
}

class _AuthenticationScreenRootState extends State<AuthenticationScreenRoot> {
  late final AuthenticationViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AuthenticationViewModel();
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
        return AuthenticationScreen(
          state: _viewModel.state,
          onEmailChanged: _viewModel.onEmailChanged,
          onPasswordChanged: _viewModel.onPasswordChanged,
          onSubmit: _viewModel.submitLogin,
        );
      },
    );
  }
}
