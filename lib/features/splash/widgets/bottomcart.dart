import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';
import '../../../core/utils/widgets/customebutton.dart';
import '../view/splashviewvideo.dart';

class BottomCartWidget extends StatelessWidget {
  BottomCartWidget({
    super.key,
    required this.title,
    required this.mainTitle,
    required this.subTitle,
    this.subTitleob,
  });
  String title;
  String mainTitle;
  String subTitle;
  String? subTitleob;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 263,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mainTitle, style: AppFonts.textMedium),
            SizedBox(height: 19),
            Text(subTitle, style: AppFonts.textRegular),
            if (subTitleob != null)
              Text(subTitleob!, style: AppFonts.subTitleob),
            if (subTitleob != null) SizedBox(height: 8),
            if (subTitleob == null) SizedBox(height: 19),

            CustomButton(
              title: title,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashViewVideo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
