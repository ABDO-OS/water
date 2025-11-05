import 'package:flutter/material.dart';
import '../colors/AppColors.dart';
import '../fonts/AppFonts.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Bottom Navigation Bar Container
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  index: 4,
                  imagePath: 'assets/images/AppBar/home.png',
                  label: 'الرئيسية',
                ),
                _buildNavItem(
                  index: 3,
                  imagePath: _selectedIndex == 3
                      ? 'assets/images/AppBar/water2.png'
                      : 'assets/images/AppBar/water.png',
                  label: 'الطلبات',
                ),
                // Spacer for center button
                const SizedBox(width: 70),
                _buildNavItem(
                  index: 1,
                  imagePath: 'assets/images/AppBar/handshake.png',
                  label: 'التعاقدات',
                ),
                _buildNavItem(
                  index: 0,
                  imagePath: 'assets/images/AppBar/Persone.png',
                  label: 'حسابي',
                ),
              ],
            ),
          ),
          // Center Button positioned to overflow
          Positioned(
            top: -25, // Half of 70 (button height) to position it half outside
            child: _buildCenterButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String imagePath,
    required String label,
  }) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.5),
                BlendMode.srcIn,
              ),
              child: Image.asset(imagePath, width: 24, height: 24),
            ),
            Text(
              label,
              style: AppFonts.textRegular.copyWith(
                fontSize: 10,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = 2;
        });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.centerbuttonColor,
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 0.15),
          //     blurRadius: 12,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'الخدمات',
              style: AppFonts.textRegular.copyWith(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
