// cSpell:disable
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:water/features/splash/widgets/custometwobuttons.dart';
import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';
import '../../../core/utils/widgets/customebutton.dart';
import '../../auth/view/loginview.dart';

class CustomBottomCartVideoWidget extends StatefulWidget {
  const CustomBottomCartVideoWidget({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
    required this.mainTitle,
    required this.subTitle,
    this.subTitleob,
    required this.step,
  });
  final int step;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final String mainTitle;
  final String subTitle;
  final String? subTitleob;

  @override
  State<CustomBottomCartVideoWidget> createState() =>
      _CustomBottomCartVideoWidgetState();
}

class _CustomBottomCartVideoWidgetState
    extends State<CustomBottomCartVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 263,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
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
            AnimatedSmoothIndicator(
              activeIndex: widget.step - 1,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColor,
                dotColor: AppColors.primaryColor.withValues(alpha: 0.3),
                dotWidth: 10,
                dotHeight: 10,
                expansionFactor: 5,
                spacing: 5.0,
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.mainTitle, style: AppFonts.textMedium),
            Text(widget.subTitle, style: AppFonts.textRegular),
            const SizedBox(height: 8),
            if (widget.subTitleob != null)
              Text(
                widget.subTitleob!,
                style: AppFonts.subTitleob.copyWith(
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            const SizedBox(height: 18),

            if (widget.step != 3)
              CustomeTwoButtons.customeTwoButtons(
                widget.onPressed1,
                widget.onPressed2,
              ),
            if (widget.step == 3)
              CustomButton(
                title: "تسجيل الدخول",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
