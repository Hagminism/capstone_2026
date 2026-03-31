import 'package:capstone_2026/core/domain/model/enum/text_field_content_type.dart';
import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextFieldContentType textFieldContentType;
  final bool? isObscureText;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    required this.textFieldContentType,
    this.isObscureText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.signInTextField,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          buildIcon(textFieldContentType),
          const SizedBox(width: 16.0),
          Expanded(
            child: TextFormField(
              obscureText:
                  (textFieldContentType != TextFieldContentType.email &&
                      isObscureText == true)
                  ? true
                  : false,
              decoration: InputDecoration(
                hintText: (textFieldContentType == TextFieldContentType.email)
                    ? '이메일 주소를 입력하세요'
                    : '비밀번호를 입력하세요',
                hintStyle: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (textFieldContentType == TextFieldContentType.password &&
              isObscureText != null)
            Row(
              children: [
                const SizedBox(width: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onTap,
                      child: Icon(
                        (isObscureText == true)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 24,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildIcon(TextFieldContentType textFieldContentType) {
    final IconData iconData;

    switch (textFieldContentType) {
      case TextFieldContentType.email:
        iconData = Icons.email_outlined;
        break;
      case TextFieldContentType.password:
        iconData = Icons.lock_outline;
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.0),
      child: Icon(
        iconData,
        size: 24,
        color: AppColors.textSecondary,
      ),
    );
  }
}
