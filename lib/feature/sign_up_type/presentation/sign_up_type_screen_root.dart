import 'package:capstone_2026/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_type_screen.dart';

class SignUpTypeScreenRoot extends StatelessWidget {
  const SignUpTypeScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpTypeScreen(
      onUserTap: () =>
          context.go('${Routes.signIn}/${Routes.signUpType}/${Routes.signUpUser}'),
      onPartnerTap: () => context.go(
        '${Routes.signIn}/${Routes.signUpType}/${Routes.signUpPartner}',
      ),
      onSignInTap: () => context.go(Routes.signIn),
    );
  }
}
