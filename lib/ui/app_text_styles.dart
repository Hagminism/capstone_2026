import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  // --- Default semantic styles ---

  /// Headline: 28px, Bold (w700)
  static const TextStyle headline = TextStyle(
    fontSize: FontSizes.headline,
    fontWeight: FontWeight.w700,
  );

  /// Title Large: 24px, Semi Bold (w600)
  static const TextStyle titleLarge = TextStyle(
    fontSize: FontSizes.titleLarge,
    fontWeight: FontWeight.w600,
  );

  /// Title Medium: 20px, Regular (w400)
  static const TextStyle titleMedium = TextStyle(
    fontSize: FontSizes.titleMedium,
    fontWeight: FontWeight.w400,
  );

  /// Subtitle: 18px, Semi Bold (w600)
  static const TextStyle subtitle = TextStyle(
    fontSize: FontSizes.subtitle,
    fontWeight: FontWeight.w600,
  );

  /// Body: 16px, Regular (w400)
  static const TextStyle body = TextStyle(
    fontSize: FontSizes.body,
    fontWeight: FontWeight.w400,
  );

  /// Body: 16px, Regular (w400), Secondary Color
  static const TextStyle bodySecondary = TextStyle(
    fontSize: FontSizes.body,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Caption: 12px, Regular (w400), Secondary Color
  static const TextStyle caption = TextStyle(
    fontSize: FontSizes.caption,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Label: 12px, Semi Bold (w600)
  static const TextStyle label = TextStyle(
    fontSize: FontSizes.label,
    fontWeight: FontWeight.w600,
  );
}

class FontSizes {
  // dart에서는 이름 있는 생성자(named constructor)를 하나라도 생성하면,
  // 클래스 생성자를 직접 관리하겠다는 것으로 간주되어 기본 생성자 사용이 불가.
  // 언더스코어(_)를 넣어 private 생성자를 하나 만들면 디자인 시스템 파일 외부에서 객체 생성 불가.
  FontSizes._();

  // 헤드라인 및 주요 제목
  static const double headline = 28.0;
  static const double titleLarge = 24.0;
  static const double titleMedium = 20.0;

  // 본문 및 보조 텍스트
  static const double subtitle = 18.0;
  static const double body = 16.0;
  static const double caption = 12.0;
  static const double label = 12.0;
}