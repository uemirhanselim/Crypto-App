import 'package:crypto_app/view/trade/trade_view.dart';
import 'package:crypto_app/view_model/wallet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/market_view_model.dart';
import '../../view_model/trade_view_model.dart';

class ITradeView extends StatelessWidget {
  const ITradeView({super.key, required this.index, required this.symbol});
  final int index;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TradeViewModel(symbol)),
        ChangeNotifierProvider(create: (context) => MarketViewModel()),
        
      ],
      child: Consumer<TradeViewModel>(
        builder: (context, tradeViewModel, child) {
          return Consumer<MarketViewModel>(
            builder: (context, marketViewModel, child) {
              return Consumer<WalletViewModel>(
                  builder: (context, walletViewModel, child) {
                return TradeView(
                    index: index,
                    symbol: symbol,
                    marketViewModel: marketViewModel,
                    tradeViewModel: tradeViewModel,
                    walletViewModel: walletViewModel);
              });
            },
          );
        },
      ),
    );
  }
}
