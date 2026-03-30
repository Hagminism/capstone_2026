import 'package:flutter/material.dart';

class StoreDetailImageCarousel extends StatefulWidget {
  const StoreDetailImageCarousel({super.key});

  @override
  State<StoreDetailImageCarousel> createState() =>
      _StoreDetailImageCarouselState();
}

class _StoreDetailImageCarouselState extends State<StoreDetailImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (_, index) {
              return Container(
                color: const Color(0xFFE5E7EB),
                child: Icon(
                  Icons.image_rounded,
                  color: Colors.grey.shade500,
                  size: 48,
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
