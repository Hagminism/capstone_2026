import 'package:capstone_2026/ui/app_colors.dart';
import 'package:flutter/material.dart';

class StoreDetailTabSection extends StatelessWidget {
  const StoreDetailTabSection({
    required this.selectedTab,
    required this.onTabSelected,
    super.key,
  });

  final int selectedTab;
  final ValueChanged<int> onTabSelected;

  static const List<String> _tabs = ['홈', '메뉴', '사진', '리뷰', '매장정보'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.border),
              bottom: BorderSide(color: AppColors.border),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _tabs.length,
            itemBuilder: (_, index) {
              final isSelected = selectedTab == index;
              return InkWell(
                onTap: () => onTabSelected(index),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected
                            ? AppColors.textPrimary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
          child: Text(
            _tabContent(selectedTab),
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  String _tabContent(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return '대표 메뉴, 가격, 구성 정보를 이 영역에 표시합니다.';
      case 2:
        return '업장/메뉴 사진 목록을 갤러리 형태로 표시합니다.';
      case 3:
        return '방문자 리뷰와 평점 통계를 이 영역에 표시합니다.';
      case 4:
        return '매장 주소, 운영시간, 주차/편의 정보 등 상세 정보를 표시합니다.';
      case 0:
      default:
        return '업장 소개, 추천 포인트, 공지사항 등 핵심 정보를 우선 제공합니다.';
    }
  }
}
