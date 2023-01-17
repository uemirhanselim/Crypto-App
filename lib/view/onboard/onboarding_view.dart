import 'package:crypto_app/utils/constants.dart';
import 'package:crypto_app/view_model/onboard/onboarding_view_model.dart';
import 'package:crypto_app/widgets/buttons/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingViewModel>(
      builder: (context, onBoardingViewModel, child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: onBoardingBackgroundImage,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // page view
                PageView(
                  controller: onBoardingViewModel.pageController,
                  onPageChanged: (index) {
                    onBoardingViewModel.checkIsLastPage(index);
                  },
                  children: onBoardingViewModel.pages,
                ),

                // dot indicator
                Container(
                    alignment: const Alignment(0, 0.6),
                    child: SmoothPageIndicator(
                      controller: onBoardingViewModel.pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.greenAccent,
                          dotColor: Colors.white,
                          dotHeight: 8,
                          dotWidth: 16),
                    )),

                onBoardingViewModel.onLastPage
                    ? OnBoardingButton(onTap: () => onBoardingViewModel.navigateToHome(context), label: "Start trading")
                    : OnBoardingButton(onTap: () => onBoardingViewModel.nextPage(), label: "Next"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
