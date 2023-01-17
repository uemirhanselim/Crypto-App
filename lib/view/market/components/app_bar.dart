part of 'package:crypto_app/view/market/market_view.dart';

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GradientText(
        "cryptofi",
        colors: [
          Colors.white,
          Colors.greenAccent,
          Colors.green.shade400,
        ],
        style: const TextStyle(fontSize: 26),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
