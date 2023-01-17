enum LottieEnum { onboard1, loading, onboard2, onboard3, appLogo }

extension LottieEnumExtension on LottieEnum {
  String _path() {
    switch (this) {
      case LottieEnum.onboard1:
        return "onboard1";
      case LottieEnum.loading:
        return "loading";
      case LottieEnum.onboard2:
        return "onboard2";
      case LottieEnum.onboard3:
        return "onboard3";
      case LottieEnum.appLogo:
        return "appLogo";
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
