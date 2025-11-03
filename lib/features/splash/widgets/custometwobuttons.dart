import 'package:flutter/material.dart';

import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';

class CustomeTwoButtons {
  static Widget customeTwoButtons(VoidCallback onPressed1, onPressed) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed1,
          child: Container(
            width: 205,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "التالي",
                  style: AppFonts.textMedium.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 97,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Center(
              child: Text(
                "تخطي",
                style: AppFonts.textMedium.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
