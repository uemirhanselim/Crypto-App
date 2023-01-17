import 'package:flutter/material.dart';

class DurationConstants extends Duration {
  DurationConstants.lottieLow() : super(seconds: 7);
  DurationConstants.lottieMedium() : super(seconds: 7);
}

const ImageProvider<Object> onBoardingBackgroundImage =
    AssetImage("assets/images/onboard_background.png");

const TextStyle onBoardTitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 4,
    fontSize: 30);

const TextStyle onBoardDescription = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white70,
    letterSpacing: 2,
    fontSize: 16);

    class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/onboard_background.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 100, 193, 146), BlendMode.darken)),
      ),
    );
  }
}
