import 'package:capstone_2026/core/domain/model/enum/auth_provider.dart';
import 'package:capstone_2026/core/presentation/component/app_bar/custom_app_bar.dart';
import 'package:capstone_2026/feature/select_auth_provider/presentation/component/auth_provider_selecting_button.dart';
import 'package:capstone_2026/feature/select_auth_provider/presentation/screen/select_auth_provider_action.dart';
import 'package:capstone_2026/feature/select_auth_provider/presentation/screen/select_auth_provider_state.dart';
import 'package:capstone_2026/ui/app_colors.dart';
import 'package:flutter/material.dart';

class SelectAuthProviderScreen extends StatelessWidget {
  final SelectAuthProviderState state;
  final void Function(SelectAuthProviderAction action) onAction;

  const SelectAuthProviderScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: '',
        showBackButton: true,
        onTap: () => onAction(SelectAuthProviderAction.tapBackButton()),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    AuthProvider.values.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: AuthProviderSelectingButton(
                          authProvider: AuthProvider.values[index],
                          onTap: () {
                            switch (AuthProvider.values[index]) {
                              case AuthProvider.email:
                                onAction(
                                  SelectAuthProviderAction.tapSignUpWithEmailButton(),
                                );
                              case AuthProvider.google:
                                onAction(
                                  SelectAuthProviderAction.tapSignUpWithGoogleButton(),
                                );
                              case AuthProvider.naver:
                                onAction(
                                  SelectAuthProviderAction.tapSignUpWithNaverButton(),
                                );
                              case AuthProvider.kakao:
                                onAction(
                                  SelectAuthProviderAction.tapSignUpWithKakaoButton(),
                                );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
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
      ),
    );
  }
}
