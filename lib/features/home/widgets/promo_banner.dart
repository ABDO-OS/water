import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utils/colors/AppColors.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Frame 25.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        // const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedSmoothIndicator(
            activeIndex: _pageController.hasClients
                ? (_pageController.page?.round() ?? 0)
                : 0,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor,
              dotColor: AppColors.primaryColor.withValues(alpha: 0.3),
              dotWidth: 8,
              dotHeight: 8,
              expansionFactor: 3,
              spacing: 6,
            ),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
