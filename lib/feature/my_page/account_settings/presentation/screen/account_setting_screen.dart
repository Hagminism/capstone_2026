import 'package:capstone_2026/feature/my_page/account_settings/presentation/screen/account_setting_action.dart';
import 'package:capstone_2026/feature/my_page/account_settings/presentation/screen/account_setting_state.dart';
import 'package:flutter/material.dart';
import 'package:capstone_2026/core/presentation/component/app_bar/custom_app_bar.dart';
import 'package:capstone_2026/feature/my_page/account_settings/component/account_activity_section.dart';
import 'package:capstone_2026/feature/my_page/account_settings/component/security_section.dart';
import 'package:capstone_2026/ui/app_colors.dart';

class AccountSettingScreen extends StatelessWidget {
  final AccountSettingState state;
  final void Function(AccountSettingAction action) onAction;

  const AccountSettingScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            title: '계정 설정',
            showBackButton: true,
            onTap: () => onAction(AccountSettingAction.tapBackButton()),
          ),
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    SecuritySection(
                      onTap: () {
                        onAction(
                          AccountSettingAction.tapChangePasswordButton(),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    AccountActivitySection(
                      onTap: (action) => onAction(action),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (state.isLoading)
          ModalBarrier(
            dismissible: false,
            color: AppColors.black.withValues(alpha: 0.2588),
          ),
        if (state.isLoading)
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
      ],
    );
  }
}
