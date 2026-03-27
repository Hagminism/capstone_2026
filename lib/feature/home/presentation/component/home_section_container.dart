import 'package:capstone_2026/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSectionContainer extends StatelessWidget {
  const HomeSectionContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}
