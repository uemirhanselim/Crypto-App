
part of 'package:crypto_app/view/trade/trade_view.dart';

class _PriceLabel extends StatelessWidget {
  const _PriceLabel({required this.market, required this.index});
  final List<Market> market;
  final int index;
  @override
  Widget build(BuildContext context) {
    final bool isMinus = market[index].priceChangePercent.startsWith('-');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Price",
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Text(
                "\$${market[index].lastPrice.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")}",
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: isMinus
                      ? Colors.redAccent.shade400
                      : Colors.greenAccent.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: isMinus
                        ? Text(market[index].priceChangePercent)
                        : Text('+${market[index].priceChangePercent}')),
              )
            ],
          ),
        ],
      ),
    );
  }
}
