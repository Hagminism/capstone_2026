import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_action.dart';
import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_screen.dart';
import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FindPasswordScreenRoot extends StatefulWidget {
  final FindPasswordViewModel viewModel;

  const FindPasswordScreenRoot({
    super.key,
    required this.viewModel,
  });

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
          onAction: (action) {
            switch (action) {
              case Submit():
                widget.viewModel.onAction(action);
                break;
              case TapSignIn():
                context.pop();
                break;
            }
          },
        );
      },
    );
  }
}
