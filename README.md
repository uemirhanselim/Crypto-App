# Flutter Crypto APP
Complete Flutter Application with Provider + Dio for API REST. (Binance API)

## Features
- API REST (Binance API, newsapi)
- Candle Graph View (Hour, Day, Week, etc)
- Wallet Processes
- Cryptocurrency Trade
- Onboarding Pages with Lottie Animations
- Crypto Related News
- Popular Cryptocurrencies

### Stack
- Flutter 3.3.2
- Dart 2.18.1
- Provider
- Dio
- Lottie
- syncfusion_flutter_charts

## Screenshots


| Onboarding 1 | Onboarding 2 | Onboarding 3 |
|  --- |  ---    |   ---    |
|<img src="https://user-images.githubusercontent.com/91256437/213161226-53ef328a-a8ca-4763-bb32-10b2a0bdb471.png" width="250">|<img src="https://user-images.githubusercontent.com/91256437/213161314-7ea149d5-052c-4fd0-ad09-16cf7238932a.png" width="250">|<img src="https://user-images.githubusercontent.com/91256437/213161363-307f1c24-fc83-4862-8adb-8bca5c858174.png" width="250">|

| Market | Trade | Wallet |
|  --- |  ---    |   ---    |
|<img src="https://user-images.githubusercontent.com/91256437/213161418-ab780441-0d6e-453e-a46a-b9853ac0d17e.png" width="250">|<img src="https://user-images.githubusercontent.com/91256437/213161644-c10d2dc4-9142-4ad1-8b92-1af473b4e4cc.png" width="250">|<img src="https://user-images.githubusercontent.com/91256437/213161701-6d6063af-ace2-4c63-b897-fe3e2389c7ad.png" width="250">|


## Setup project

Download project
```bash
git clone https://github.com/uemirhanselim/Crypto-App.git
```

Get flutter dependencies
```bash
flutter pub get
```

You need to create an account at https://www.binance.com/en to get a personal API KEY and SECRET KEY

Go to lib/service/binance/api_keys.dart then put there your API KEY and SECRET KEY
```bash
  static const String apiKeyId = "---YOUR API KEY---";
  static const String secretKey = "---YOUR SECRET KEY---";
```

Run the app
```bash
flutter run
```

## Resources
[Flutter Docs](https://flutter.dev/docs)

[Provider Docs](https://pub.dev/documentation/provider/latest/)

[Binance Docs](https://binance-docs.github.io/apidocs/spot/en/#introduction)
