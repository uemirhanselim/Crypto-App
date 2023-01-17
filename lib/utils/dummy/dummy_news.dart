import 'package:flutter/material.dart';

class DummyNewsData {
  static List<AssetImage> news = const [
    AssetImage("assets/images/news1.jpg"),
    AssetImage("assets/images/news2.jpg"),
    AssetImage("assets/images/news3.jpg"),
    AssetImage("assets/images/news4.jpg"),
    AssetImage("assets/images/news5.jpeg"),
  ];

  static List<String> newsTitles = [
    "cryptonews",
    "CNBC",
    "OKX",
    "BINANCE",
    "FTX",
  ];

  static List<String> newsDescription = [
    "Bitcoin Price Prediction as Bears Take Control - How Low Can BTC Go?...",
    "Legendary 'The Big Short' Investor Michael Burry Believes Binance Crypto Exchange Audit Is Meaningless - Here's Why...",
    "Leading Crypto Exchange Reports Outage for Several Hours with Deposits and Withdrawals Affected - Here's What Happened...",
    "Binance Sees Over \$3 Billion in Customer Withdrawals in 24 Hours - Here's What's Happening...",
    "New FTX CEO Says 'Unacceptable Practices' by 'Inexperienced and Unsophisticated Individuals' Led to FTX Collapse - Here's What Happened...",
  ];

  static List<String> newsUrls = [
    "https://cryptonews.com/news/bitcoin-price-prediction-as-bears-take-control-how-low-can-btc-go.htm",
    "https://cryptonews.com/news/legendary-the-big-short-investor-michael-burry-believes-binance-crypto-exchange-audit-meaningless-heres-why.htm",
    "https://cryptonews.com/news/leading-crypto-exchange-reports-outage-for-several-hours-with-deposits-withdrawals-affected-heres-what-happened.htm",
    "https://cryptonews.com/news/binance-sees-over-3-billion-customer-withdrawals-24-hours-heres-whats-happening.htm",
    "https://cryptonews.com/news/new-ftx-ceo-says-unacceptable-practices-by-inexperienced-unsophisticated-individuals-led-ftx-collapse-heres-what-happened.htm",
  ];
}
