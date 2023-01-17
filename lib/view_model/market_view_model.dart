import 'dart:async';

import 'package:crypto_app/model/market_model.dart';
import 'package:crypto_app/service/binance/dio_service.dart';
import 'package:crypto_app/utils/packages/url_launcher.dart';
import 'package:flutter/material.dart';

import '../view/trade/i_trade_view.dart';

class MarketViewModel extends ChangeNotifier with LaunchMixin {
  MarketViewModel() {
    _dioService = DioService();
    getMarketData();
  }

  late final IDioService _dioService;
  //late Timer _timer;
  double money = 0.0;
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  Stream<List<Market>> getMarketData() async* {
    var streamController = StreamController<List<Market>>();

    List<Market> markets = [];

    // _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
    List<dynamic> list = await _dioService.get24hrData();
    var filteredList = list.where((element) =>
        element['symbol'].toString().contains("USDT") &&
        element['lastPrice'].toString().contains(RegExp(r'[1-9]')) &&
        (element['count'] > 54022));

    markets = filteredList.map((e) {
      return Market(
        symbol: e['symbol'],
        lastPrice: e['lastPrice'],
        priceChangePercent: e['priceChangePercent'],
      );
    }).toList();
    streamController.add(markets);
    // });

    yield* streamController.stream;
  }

  void goToWebsite({required String url}) {
    launchTheURL(url);
  }

  void navigateToTradeView(BuildContext context, int index, String symbol) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ITradeView(index: index, symbol: symbol)));
  }

  void changeVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }
}
