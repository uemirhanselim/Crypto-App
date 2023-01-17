import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_app/utils/dummy/dummy_news.dart';
import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../model/market_model.dart';
import '../../utils/constants.dart';
import '../../utils/extensions/lottie_extension.dart';
part 'components/news_carousel.dart';
part 'components/app_bar.dart';
part 'components/market_data_card.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> with TickerProviderStateMixin {
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
        Scaffold(
          appBar: const _AppBar(),
          backgroundColor: Colors.transparent,
          body: Consumer<MarketViewModel>(
            builder: (context, marketViewModel, child) {
              return StreamBuilder(
                stream: marketViewModel.getMarketData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Market> coins = snapshot.data;
                    return Column(
                      children: [
                        _NewsCarousel(marketViewModel: marketViewModel),
                        const SizedBox(
                          height: 14,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return _MarketDataCard(
                                  marketViewModel: marketViewModel,
                                  index: index,
                                  coins: coins);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 6),
                            itemCount: coins.length,
                          ),
                        ),
                      ],
                    );
                  }

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
                },
              );
            },
          ),
        ),
      ],
    );
  }
}



/*
StreamBuilder(
            stream: marketViewModel.getMarketData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Market> markets = snapshot.data;
                return Center(
                  child: Text(markets[0].symbol),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.greenAccent,
                ));
              }
            },
          );
 */
