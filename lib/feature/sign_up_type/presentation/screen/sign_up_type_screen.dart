import 'package:capstone_2026/feature/sign_up_type/presentation/component/sign_up_type_card.dart';
import 'package:capstone_2026/feature/sign_up_type/presentation/screen/sign_up_type_action.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignUpTypeScreen extends StatelessWidget {
  final void Function(SignUpTypeAction) onAction;

  const SignUpTypeScreen({
    required this.onAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7FAFF), Color(0xFFEFF4FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('회원가입', style: AppTextStyles.headline),
                    const SizedBox(height: 8),
                    const Text(
                      '어떤 유형으로 시작할까요?',
                      style: AppTextStyles.subtitle,
                    ),
                    const SizedBox(height: 24),
                    SignUpTypeCard(
                      title: '일반 사용자로 시작하기',
                      description: '최소한의 정보로 빠르게 가입하고\n예약 서비스를 바로 이용할 수 있어요.',
                      icon: Icons.person_outline_rounded,
                      accentColor: const Color(0xFF2563EB),
                      onTap: () => onAction(SignUpTypeAction.tapUser()),
                    ),
                    const SizedBox(height: 14),
                    SignUpTypeCard(
                      title: '파트너(관리자)로 시작하기',
                      description: '업장 운영에 필요한 추가 정보를 입력하고\n매장 예약 관리를 시작해요.',
                      icon: Icons.storefront_outlined,
                      accentColor: const Color(0xFF4F46E5),
                      onTap: () => onAction(SignUpTypeAction.tapPartner()),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '이미 계정이 있나요? ',
                          style: AppTextStyles.subtitle,
                        ),
                        TextButton(
                          onPressed: () =>
                              onAction(SignUpTypeAction.tapSignIn()),
                          child: const Text('로그인'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}