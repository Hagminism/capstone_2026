import 'package:capstone_2026/core/domain/model/enum/auth_provider.dart';
import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthProviderSelectingButton extends StatelessWidget {
  final AuthProvider authProvider;
  final void Function() onTap;

  const AuthProviderSelectingButton({
    super.key,
    required this.authProvider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          height: 56,
          decoration: BoxDecoration(
            border: BoxBorder.all(
              style: BorderStyle.solid,
              color: AppColors.authProviderButton,
            ),
            borderRadius: BorderRadius.circular(8),
            color: buildColor(authProvider),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 1),
                  buildIcon(authProvider),
                ],
              ),
              const SizedBox(width: 8),
              buildText(authProvider),
            ],
          ),
        ),
      ),
    );
  }

  Color buildColor(AuthProvider authProvider) {
    switch (authProvider) {
      case AuthProvider.email:
        return AppColors.signUpWithEmailButton;
      case AuthProvider.google:
        return AppColors.signUpWithGoogleButton;
      case AuthProvider.naver:
        return AppColors.signUpWithNaverButton;
      case AuthProvider.kakao:
        return AppColors.signUpWithKakaoButton;
    }
  }

  Widget buildIcon(AuthProvider authProvider) {
    switch (authProvider) {
      case AuthProvider.email:
        return Icon(Icons.email_outlined, size: 24);
      case AuthProvider.google:
        return Image.asset('assets/icons/google.png', width: 20, height: 20);
      case AuthProvider.naver:
        return Image.asset('assets/icons/naver.png', width: 20, height: 20);
      case AuthProvider.kakao:
        return Image.asset('assets/icons/kakao.png', width: 20, height: 20);
    }
  }

  Widget buildText(AuthProvider authProvider) {
    final String title = '${authProvider.toDisplayName()}로 회원가입';

    switch (authProvider) {
      case AuthProvider.email:
        return Text(
          title,
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.signUpWithEmailButtonText,
          ),
        );
      case AuthProvider.google:
        return Text(
          title,
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.signUpWithGoogleButtonText,
          ),
        );
      case AuthProvider.naver:
        return Text(
          title,
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.signUpWithNaverButtonText,
          ),
        );
      case AuthProvider.kakao:
        return Text(
          title,
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.signUpWithKakaoButtonText,
          ),
        );
    }
  }
}
