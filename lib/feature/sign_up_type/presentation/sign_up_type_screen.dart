import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/app_text_styles.dart';

class SignUpTypeScreen extends StatelessWidget {
  const SignUpTypeScreen({
    required this.onUserTap,
    required this.onPartnerTap,
    required this.onSignInTap,
    super.key,
  });

  final VoidCallback onUserTap;
  final VoidCallback onPartnerTap;
  final VoidCallback onSignInTap;

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
                    _SignUpTypeCard(
                      title: '일반 사용자로 시작하기',
                      description: '최소한의 정보로 빠르게 가입하고\n예약 서비스를 바로 이용할 수 있어요.',
                      icon: Icons.person_outline_rounded,
                      accentColor: const Color(0xFF2563EB),
                      onTap: onUserTap,
                    ),
                    const SizedBox(height: 14),
                    _SignUpTypeCard(
                      title: '파트너(관리자)로 시작하기',
                      description: '업장 운영에 필요한 추가 정보를 입력하고\n매장 예약 관리를 시작해요.',
                      icon: Icons.storefront_outlined,
                      accentColor: const Color(0xFF4F46E5),
                      onTap: onPartnerTap,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('이미 계정이 있나요? ', style: AppTextStyles.subtitle),
                        TextButton(
                          onPressed: onSignInTap,
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

class _SignUpTypeCard extends StatelessWidget {
  const _SignUpTypeCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1F0F172A),
                blurRadius: 14,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: accentColor),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
