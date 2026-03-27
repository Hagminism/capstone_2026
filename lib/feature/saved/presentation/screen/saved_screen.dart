import 'package:capstone_2026/core/routing/routes.dart';
import 'package:capstone_2026/feature/saved/presentation/component/saved_empty_state.dart';
import 'package:capstone_2026/feature/saved/presentation/component/saved_filter_chips.dart';
import 'package:capstone_2026/feature/saved/presentation/component/saved_page_header.dart';
import 'package:capstone_2026/feature/saved/presentation/component/saved_store_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  static const List<String> _filters = ['전체', '식당', '카페', '미용실', '스터디카페'];
  String _selectedFilter = '전체';

  final List<_SavedStoreItem> _savedStores = [
    _SavedStoreItem(
      id: 's1',
      name: '라운지 파스타',
      category: '식당',
      subtitle: '도보 8분 · 영업중',
      rating: 4.8,
      reviewCount: 128,
    ),
    _SavedStoreItem(
      id: 's2',
      name: '블루보틀 타입 카페',
      category: '카페',
      subtitle: '도보 5분 · 영업중',
      rating: 4.7,
      reviewCount: 96,
    ),
    _SavedStoreItem(
      id: 's3',
      name: '모던 헤어 스튜디오',
      category: '미용실',
      subtitle: '도보 11분 · 영업종료',
      rating: 4.6,
      reviewCount: 83,
    ),
    _SavedStoreItem(
      id: 's4',
      name: '다온 스터디 라운지',
      category: '스터디카페',
      subtitle: '도보 13분 · 영업중',
      rating: 4.5,
      reviewCount: 57,
    ),
  ];

  List<_SavedStoreItem> get _visibleStores {
    if (_selectedFilter == '전체') {
      return _savedStores;
    }
    return _savedStores.where((item) => item.category == _selectedFilter).toList();
  }

  void _removeBookmark(String id) {
    setState(() {
      _savedStores.removeWhere((item) => item.id == id);
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('저장 목록에서 제거되었습니다.')),
      );
  }

  @override
  Widget build(BuildContext context) {
    final visibleStores = _visibleStores;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SavedPageHeader(),
              const SizedBox(height: 14),
              SavedFilterChips(
                filters: _filters,
                selectedFilter: _selectedFilter,
                onFilterSelected: (filter) {
                  setState(() {
                    _selectedFilter = filter;
                  });
                },
              ),
              const SizedBox(height: 16),
              if (visibleStores.isEmpty)
                SavedEmptyState(
                  onExploreTap: () => context.go(Routes.home),
                )
              else
                Column(
                  children: visibleStores
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SavedStoreCard(
                            name: item.name,
                            category: item.category,
                            subtitle: item.subtitle,
                            rating: item.rating,
                            reviewCount: item.reviewCount,
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text('업장 상세 화면은 다음 스텝에서 연결할 예정입니다.'),
                                  ),
                                );
                            },
                            onBookmarkTap: () => _removeBookmark(item.id),
                          ),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SavedStoreItem {
  const _SavedStoreItem({
    required this.id,
    required this.name,
    required this.category,
    required this.subtitle,
    required this.rating,
    required this.reviewCount,
  });

  final String id;
  final String name;
  final String category;
  final String subtitle;
  final double rating;
  final int reviewCount;
}
