import 'package:capstone_2026/ui/app_colors.dart';
import 'package:capstone_2026/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular((borderRadius != null) ? borderRadius! : 12),
        child: Ink(
          height: (height != null) ? height! : 56,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(
                (borderRadius != null) ? borderRadius! : 12),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.subtitle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: (fontSize != null) ? fontSize! : null,
                color:
                    (textColor != null) ? textColor : AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
