part of 'package:crypto_app/view/trade/trade_view.dart';

class _IntervalButtons extends StatelessWidget {
  const _IntervalButtons({required this.tradeViewModel});
  final TradeViewModel tradeViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _intervalSelectWidget("15m"),
          _intervalSelectWidget("30m"),
          _intervalSelectWidget("1h"),
          _intervalSelectWidget("4h"),
          _intervalSelectWidget("8h"),
          _intervalSelectWidget("12h"),
          _intervalSelectWidget("1d"),
          _intervalSelectWidget("1w"),
        ],
      ),
    );
  }

  Widget _intervalSelectWidget(String interval) {
    return InkWell(
      onTap: () {
        tradeViewModel.changeInterval(value: interval);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            interval,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
