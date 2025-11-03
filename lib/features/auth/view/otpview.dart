import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';
import '../../../core/utils/widgets/customebutton.dart';
import '../../home/view/home_view.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  bool _hasPressed = false;

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    // Mark as pressed after first attempt
    if (!_hasPressed) {
      setState(() {
        _hasPressed = true;
      });
    }

    final otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 4) {
      // OTP is valid, navigate to home page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),

                      Text(
                        "رجوع",
                        style: AppFonts.textRegular.copyWith(
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset("assets/images/hedphone.png"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("أدخل رمز التحقق", style: AppFonts.otpTitle),
            const SizedBox(height: 12),
            Text(
              "سيتم إرسال رمز التحقق إلى الواتساب",
              style: AppFonts.textRegular,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${widget.phoneNumber} 966+ ",
                  style: AppFonts.textRegular.copyWith(color: Colors.black),
                ),
                SizedBox(width: 4),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "تغيير",
                    style: AppFonts.textRegular.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Image.asset("assets/images/Watdesign.png", width: 327, height: 100),
            const SizedBox(height: 24),
            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(4, (index) {
                final screenWidth = MediaQuery.of(context).size.width;
                final boxSize = screenWidth * 0.15; // Responsive size
                return Container(
                  width: boxSize < 33 ? 33 : boxSize,
                  height: boxSize < 35 ? 35 : boxSize,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: AppFonts.titlelogin.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: boxSize * 0.5,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor.withValues(alpha: 0.3),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 12),
            Text(
              "إرسال مرة أخرى (60ث)",
              style: AppFonts.textRegular.copyWith(
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),

            const SizedBox(height: 14),
            CustomButton(
              title: "تأكيد",
              onPressed: _verifyOtp,
              backgroundcolor: _hasPressed
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withValues(alpha: 0.5),
              textcolor: Colors.white,
              radius: 14,
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: "تجربة طريقة ثانية",
              onPressed: () {},
              backgroundcolor: Colors.white,
              textcolor: AppColors.primaryColor,
              radius: 14,
              borderColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
