import 'package:flutter/material.dart';
import '../widgets/bottomcartvideo.dart';
import '../widgets/videos.dart';

class SplashViewVideo extends StatefulWidget {
  const SplashViewVideo({super.key});

  @override
  State<SplashViewVideo> createState() => _SplashViewVideoState();
}

class _SplashViewVideoState extends State<SplashViewVideo> {
  int step = 0; // 0..2

  final List<String> titles = const [
    'راحتك أولاً',
    'سواقيين دايم جاهزين',
    'ادفع مثل ما تحب',
  ];

  final List<String> subTitles = const [
    'اطلب المويه وأنت مرتاح',
    'أقرب سواق يوصل لك بسرعة',
    'ادفع بطريقتك',
  ];

  final List<String> subTitleObs = const [
    'كل اللي عليك تحدد موقعك، واحنا نوصّلك الوايت لين عند بابك،\nبدون تعب ولا انتظار.',
    'تطبيقنا يربطك بأقرب سواق متوفر، وتتابع طلبك لحظة بلحظة\n من أول ما ينطلق لين يوصل.',
    'تقدر تدفع إلكتروني أو عند التسليم، وإيصالك يوصلك على طول في التطبيق.،بدون تعب ولا انتظار.',
  ];

  void _nextStep() {
    setState(() {
      step = (step + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: VideosWidget(index: step, loopSingle: true),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomCartVideoWidget(
              step: step + 1,
              onPressed1: _nextStep,
              onPressed2: () {},
              mainTitle: titles[step],
              subTitle: subTitles[step],
              subTitleob: subTitleObs[step],
            ),
          ),
        ],
      ),
    );
  }
}
