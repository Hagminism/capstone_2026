import 'package:capstone_2026/core/domain/model/enum/text_field_content_type.dart';
import 'package:capstone_2026/core/presentation/component/button/primary_button.dart';
import 'package:capstone_2026/core/presentation/component/text_field/custom_text_field.dart';
import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_action.dart';
import 'package:capstone_2026/feature/find_password/presentation/screen/find_password_state.dart';
import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class FindPasswordScreen extends StatelessWidget {
  final FindPasswordState state;
  final void Function(FindPasswordAction) onAction;

  const FindPasswordScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1F0F172A),
                        blurRadius: 20,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('비밀번호 찾기', style: AppTextStyles.headline),
                        const SizedBox(height: 8),
                        const Text(
                          '가입한 이메일을 입력하면\n비밀번호 재설정 안내를 보내드려요.',
                          style: AppTextStyles.body,
                        ),
                        const SizedBox(height: 24),
                        const Text('이메일', style: AppTextStyles.label),
                        const SizedBox(height: 8),
                        CustomTextField(
                          textFieldContentType: TextFieldContentType.email,
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          text: '재설정 메일 보내기',
                          onTap: () => onAction(FindPasswordAction.submit()),
                          fontSize: 15,
                          height: 50,
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: TextButton(
                            onPressed: () =>
                                onAction(FindPasswordAction.tapSignIn()),
                            child: const Text('로그인으로 돌아가기'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (state.isSubmitting)
          ModalBarrier(
            dismissible: false,
            color: AppColors.black.withValues(alpha: 0.2588),
          ),
        if (state.isSubmitting)
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
      ],
    );
  }
}
