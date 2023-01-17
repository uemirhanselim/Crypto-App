import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/utils/extensions/lottie_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingView1 extends StatefulWidget {
  const OnBoardingView1({super.key});

  @override
  State<OnBoardingView1> createState() => _OnBoardingView1State();
}

class _OnBoardingView1State extends State<OnBoardingView1>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: DurationConstants.lottieLow());
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
            LottieEnum.onboard1.lottiePath,
            fit: BoxFit.cover,
            repeat: true,
            animate: true,
            controller: _animationController,
            onLoaded: (p0) {
              _animationController.forward();
              _animationController.repeat();
            },
          ),
          const Text("Build your future",
              style: onBoardTitle),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
                "Start investing today and your future will change for the better.",
                style: onBoardDescription,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
