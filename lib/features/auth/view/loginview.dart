import 'package:flutter/material.dart';

import '../../../core/utils/colors/AppColors.dart';
import '../../../core/utils/fonts/AppFonts.dart';
import '../../../core/utils/widgets/customebutton.dart';
import '../widgets/textfield.dart';
import 'otpview.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  String? _errorText;
  bool _hasPressed = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _validateAndContinue() {
    final phone = _phoneController.text;

    // Mark as pressed after first attempt
    if (!_hasPressed) {
      setState(() {
        _hasPressed = true;
      });
    }

    // Validate: must be exactly 10 digits and start with "05"
    if (phone.length != 10 || !phone.startsWith('05')) {
      setState(() {
        _errorText = "ادخل رقم الهاتف الصحيح";
      });
    } else {
      setState(() {
        _errorText = null;
      });
      // Phone is valid, navigate to OTP screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpView(phoneNumber: phone)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset("assets/images/hedphone.png"),
                ),
              ],
            ),

            Text("إنشاء حساب او تسجيل الدخول", style: AppFonts.titlelogin),
            const SizedBox(height: 14),
            SizedBox(
              height: _errorText != null ? 80 : 56,
              child: TextFieldWidget(
                hintText: "ادخل رقم هاتفك",
                controller: _phoneController,
                errorText: _errorText,
              ),
            ),
            const SizedBox(height: 50),

            CustomButton(
              title: "المتابعة",
              onPressed: _validateAndContinue,
              backgroundcolor: _hasPressed
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withValues(alpha: 0.5),
              textcolor: _hasPressed
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.5),
              radius: 14,
            ),
            const SizedBox(height: 8),
            Center(child: Text("سياسة الخصوصية", style: AppFonts.textLink)),
          ],
        ),
      ),
    );
  }
}
