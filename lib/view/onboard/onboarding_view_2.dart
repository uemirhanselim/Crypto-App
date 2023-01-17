import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/extensions/lottie_extension.dart';

class OnBoardingView2 extends StatefulWidget {
  const OnBoardingView2({super.key});

  @override
  State<OnBoardingView2> createState() => _OnBoardingView2State();
}

class _OnBoardingView2State extends State<OnBoardingView2>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: DurationConstants.lottieMedium());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            LottieEnum.onboard2.lottiePath,
            fit: BoxFit.cover,
            repeat: true,
            animate: true,
            controller: _animationController,
            onLoaded: (p0) {
              _animationController.forward();
              _animationController.repeat();
            },
          ),
          const Text("Encrypted Wallet",
              style: onBoardTitle),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Keep your investment safe with our encrypted wallet.",
                style: onBoardDescription,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
