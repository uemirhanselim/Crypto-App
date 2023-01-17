part of 'package:crypto_app/view/market/market_view.dart';

class _MarketDataCard extends StatelessWidget {
  const _MarketDataCard({required this.marketViewModel, required this.index, required this.coins});
  final MarketViewModel marketViewModel;
  final int index;
  final List<Market> coins;

  @override
  Widget build(BuildContext context) {
    final bool isMinus = coins[index]
                                  .priceChangePercent
                                  .startsWith('-');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          marketViewModel.navigateToTradeView(
              context, index, coins[index].symbol);
        },
        child: Card(
          color: Colors.white.withOpacity(0.5),
          child: ListTile(
            textColor: Colors.black,
            title: Text(
              coins[index].symbol.toString().replaceAll("USDT", ""),
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$${coins[index].lastPrice.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: isMinus
                        ? const Color.fromARGB(255, 232, 22, 64)
                        : const Color.fromARGB(255, 4, 209, 109),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: isMinus
                          ? Text(
                              coins[index].priceChangePercent,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              '+${coins[index].priceChangePercent}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                )
              ],
            ),
            leading: coinLogos.contains(coins[index].symbol)
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child:
                        Image.asset('assets/logo/${coins[index].symbol}.png'))
                : SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/logo/UNKNOWN.png',
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
