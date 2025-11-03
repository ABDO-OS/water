import 'package:flutter/material.dart';
import 'package:water/core/utils/fonts/AppFonts.dart';
import '../colors/AppColors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.textcolor,
    this.backgroundcolor,
    this.radius,
    this.borderColor,
  });
  final double? radius;
  final String title;
  final Color? textcolor;
  final Color? backgroundcolor;
  final Color? borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: backgroundcolor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 12),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.5)
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: AppFonts.textMedium.copyWith(
              color: textcolor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
