part of 'package:crypto_app/view/trade/trade_view.dart';

class _InfoBody extends StatelessWidget {
  const _InfoBody({required this.candle});

  final List<Candle> candle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _informations("Opening Price", candle.last.open.toString()),
          _informations("Close Price", candle.last.close.toString()),
          _informations("High Price", candle.last.high.toString()),
          _informations("Low Price", candle.last.low.toString()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Column _informations(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "\$$value",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
