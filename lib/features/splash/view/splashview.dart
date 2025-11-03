import 'package:flutter/material.dart';

import '../../../core/utils/colors/AppColors.dart';
import '../widgets/bottomcart.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BottomCartWidget(
            title: 'دخول',
            mainTitle: 'إشعار الإذن',
            subTitle:
                'تطبيق (اسم التطبيق) يحتاج موقعك بدقّة عشان نحسّن التسجيل ونقدر نوصّلك الطلب حتى لو التطبيق مقفّل أو ماتستخدمه حالياً. بعد، بنجمع أرقام الجوالات ونقرى ونكتبها عشان نسهل عليك تواصل مع السواق أو متابعة طلبك بكل سهولة.',
          ),
        ],
      ),
    );
  }
}
