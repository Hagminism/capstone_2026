import 'package:flutter/material.dart';
import 'package:capstone_2026/feature/my_page/account_settings/component/account_setting_primary_button.dart';
import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';

class SecuritySection extends StatelessWidget {
  final void Function() onTap;

  const SecuritySection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            '보안 및 관리',
            style: AppTextStyles.label.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.securitySectionHeader,
              letterSpacing: 0.6,
            ),
          ),
        ),
        AccountSettingPrimaryButton(
          onTap: () => onTap(),
          title: '비밀번호 변경',
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.lock_outline,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
