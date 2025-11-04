import 'package:flutter/material.dart';
import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 35, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/location.png", width: 40, height: 40),

          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'موقعك الحالي',
                style: AppFonts.textRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.primaryColor.withValues(alpha: 0.5),
                ),
              ),
              Row(
                children: [
                  Text(
                    'طريق ديراب, حي المروة',
                    style: AppFonts.textRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 39),
          Image.asset("assets/images/noti.png", width: 40, height: 40),
          const SizedBox(width: 8),
          Image.asset("assets/images/message.png", width: 40, height: 40),
        ],
      ),
    );
  }
}
