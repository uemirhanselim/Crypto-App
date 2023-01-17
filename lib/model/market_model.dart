import 'dart:convert';

class Market {
  String symbol;
  String lastPrice;
  String priceChangePercent;

  Market({
    required this.symbol,
    required this.lastPrice,
    required this.priceChangePercent,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'symbol': symbol});
    result.addAll({'price': lastPrice});
    result.addAll({'priceChangePercent': priceChangePercent});

    return result;
  }

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(
      symbol: map['symbol'] ?? '',
      lastPrice: map['lastPrice'] ?? '',
      priceChangePercent: map['priceChangePercent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Market.fromJson(String source) => Market.fromMap(json.decode(source));
}

const List<String> coinLogos = [
  "BTCUSDT",
  "ADAUSDT",
  "ATOMUSDT",
  "AVAXUSDT",
  "BNBUSDT",
  "BUSDUSDT",
  "DARUSDT",
  "DOGEUSDT",
  "ETHUSDT",
  "FETUSDT",
  "FTMUSDT",
  "LINKUSDT",
  "LTCUSDT",
  "MATICUSDT",
  "NEARUSDT",
  "OPUSDT",
  "SANDUSDT",
  "SCUSDT",
  "SHIBUSDT",
  "SOLUSDT",
  "STORJUSDT",
  "TRXUSDT",
  "WAVEUSDT",
  "XRPUSDT",
];
