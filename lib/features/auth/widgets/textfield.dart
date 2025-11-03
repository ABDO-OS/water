import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.errorText,
  });
  final String hintText;
  final TextEditingController controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          maxLines: 1,
          keyboardType: TextInputType.phone,
          style: AppFonts.testfiels.copyWith(
            color: hasError ? AppColors.red : AppColors.primaryColor,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppFonts.testfiels.copyWith(
              color: AppColors.primaryColor.withValues(alpha: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: hasError ? AppColors.red : AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: hasError ? AppColors.red : AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(14),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "966+",
                    style: AppFonts.testfiels.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    "assets/images/flag.png",
                    width: 24,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 12),
            child: Text(
              errorText!,
              style: AppFonts.testfiels.copyWith(
                color: AppColors.red,
                fontSize: 10,
              ),
            ),
          ),
      ],
    );
  }
}
