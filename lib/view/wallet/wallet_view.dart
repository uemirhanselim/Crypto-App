import 'dart:ui';

import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:crypto_app/view_model/wallet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../model/market_model.dart';
import '../../utils/constants.dart';
import '../../utils/extensions/lottie_extension.dart';
part 'components/grid_view.dart';
part 'components/wallet_card.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        SafeArea(
          child: Consumer<MarketViewModel>(
              builder: (context, marketViewModel, index) {
            return Consumer<WalletViewModel>(
                builder: (context, walletViewModel, index) {
              return StreamBuilder(
                  stream: marketViewModel.getMarketData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Market> market = snapshot.data;
                      for (var e in walletViewModel.appWallet) {
                        marketViewModel.money = e.amount.toDouble() *
                            double.parse(market[0].lastPrice);
                      }
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Stack(
                                  children: [
                                    _backdropFilter(),
                                    _WalletCard(
                                        marketViewModel: marketViewModel,
                                        walletViewModel: walletViewModel),
                                  ],
                                )),
                            _getTestTokenButton(walletViewModel),
                            const SizedBox(height: 20),
                            _assetsLabel(walletViewModel),
                            const SizedBox(
                              height: 10,
                            ),
                            _GridView(walletViewModel: walletViewModel),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: LottieBuilder.asset(
                          LottieEnum.loading.lottiePath,
                          height: 80,
                          width: 80,
                          repeat: true,
                          animate: true,
                          controller: _animationController,
                          onLoaded: (p0) {
                            _animationController.forward();
                          },
                        ),
                      );
                    }
                  });
            });
          }),
        ),
      ],
    );
  }

  BackdropFilter _backdropFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
      ),
    );
  }

  Padding _assetsLabel(WalletViewModel walletViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Text(
            "My Assets",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          const SizedBox(width: 15),
          Text(
            '( ${walletViewModel.appWallet.length.toString()} )',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Padding _getTestTokenButton(WalletViewModel walletViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          walletViewModel.changeTotalBalance(20000);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              "Get Test Tokens",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
