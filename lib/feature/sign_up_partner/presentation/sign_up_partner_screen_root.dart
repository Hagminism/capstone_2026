import 'package:capstone_2026/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_partner_screen.dart';
import 'sign_up_partner_view_model.dart';

class SignUpPartnerScreenRoot extends StatefulWidget {
  const SignUpPartnerScreenRoot({
    super.key,
    required this.viewModel,
  });

  final SignUpPartnerViewModel viewModel;

  @override
  State<SignUpPartnerScreenRoot> createState() =>
      _SignUpPartnerScreenRootState();
}

class _SignUpPartnerScreenRootState extends State<SignUpPartnerScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SignUpPartnerScreen(
          state: widget.viewModel.state,
          onNameChanged: widget.viewModel.onNameChanged,
          onEmailChanged: widget.viewModel.onEmailChanged,
          onPasswordChanged: widget.viewModel.onPasswordChanged,
          onPasswordConfirmChanged: widget.viewModel.onPasswordConfirmChanged,
          onStoreNameChanged: widget.viewModel.onStoreNameChanged,
          onBusinessRegistrationNumberChanged:
              widget.viewModel.onBusinessRegistrationNumberChanged,
          onStoreLocationChanged: widget.viewModel.onStoreLocationChanged,
          onTermsChanged: widget.viewModel.onTermsChanged,
          onSubmit: widget.viewModel.submitSignUpPartner,
          onSignInTap: () => context.go(Routes.signIn),
        );
      },
    );
  }
}
