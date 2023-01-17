import 'dart:async';

import 'package:crypto_app/service/binance/dio_service.dart';
import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/candle_model.dart';

class TradeViewModel extends ChangeNotifier {
  TradeViewModel(String symbol) {
    _dioService = DioService();
    marketViewModel = MarketViewModel();
    getCandleData(symbol);
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  // late Timer _timer;
  late MarketViewModel marketViewModel;
  final TextEditingController _controller = TextEditingController();
  final TrackballBehavior _trackballBehavior = TrackballBehavior(
    enable: true,
    activationMode: ActivationMode.longPress,
  );
  final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
    enablePanning: true,
    enableMouseWheelZooming: true,
    enablePinching: true,
    enableDoubleTapZooming: true,
  );
  late final IDioService _dioService;
  String _interval = "15m";
  num _title = 0;

  String get interval => _interval;
  num get title => _title;
  TrackballBehavior get trackballBehavior => _trackballBehavior;
  ZoomPanBehavior get zoomPanBehavior => _zoomPanBehavior;
  TextEditingController get controller => _controller;

  Stream<List<Candle>> getCandleData(String symbol) async* {
    var streamController = StreamController<List<Candle>>();

    List<Candle> candleData = [];

    // _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
    List<dynamic> list =
        await _dioService.getCandleData(symbol: symbol, interval: interval);

    candleData = list.map((e) {
      return Candle(
        x: DateTime.fromMillisecondsSinceEpoch(e[0]),
        high: num.parse(e[2]),
        low: num.parse(e[3]),
        close: num.parse(e[4]),
        open: num.parse(e[1]),
      );
    }).toList();
    streamController.add(candleData);
    // });

    yield* streamController.stream;
  }

  void changeInterval({required String value}) {
    _interval = value;
    notifyListeners();
  }

  void changeTitle(num value) {
    _title = value;
  }
}
