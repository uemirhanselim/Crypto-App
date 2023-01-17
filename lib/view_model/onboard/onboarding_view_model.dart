import 'package:crypto_app/view/bottom_bar_view.dart';
import 'package:crypto_app/view/onboard/onboarding_view_1.dart';
import 'package:crypto_app/view/onboard/onboarding_view_2.dart';
import 'package:crypto_app/view/onboard/onboarding_view_3.dart';
import 'package:flutter/material.dart';

class OnBoardingViewModel extends ChangeNotifier {
  bool _onLastPage = false;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const OnBoardingView1(),
    const OnBoardingView2(),
    const OnBoardingView3(),
  ];

  bool get onLastPage => _onLastPage;
  PageController get pageController => _pageController;
  List<Widget> get pages => _pages;

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  void checkIsLastPage(int index) {
    _onLastPage = (index == 2);
    notifyListeners();
  }

  void navigateToHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BottomBarView()));
  }
}
