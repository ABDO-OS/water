import 'package:flutter/material.dart';
import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.serchColor.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: AppColors.serchColorBorder.withValues(alpha: 0.5),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.primaryColor, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    'حدد وين تبغى تستلم؟',
                    style: AppFonts.textRegular.copyWith(
                      color: AppColors.primaryColor.withValues(alpha: 0.6),
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/AFTER.png", width: 76, height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
