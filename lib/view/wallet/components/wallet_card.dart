part of 'package:crypto_app/view/wallet/wallet_view.dart';

class _WalletCard extends StatelessWidget {
  const _WalletCard({required this.marketViewModel, required this.walletViewModel});
  final MarketViewModel marketViewModel;
  final WalletViewModel walletViewModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Total Balance(USD)",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    marketViewModel.changeVisibility();
                  },
                  child: Icon(
                    marketViewModel.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              marketViewModel.isVisible
                  ? '\$${walletViewModel.totalBalance.toString()}'
                  : "\$*******",
              overflow: TextOverflow.clip,
              style: const TextStyle(
                  fontSize: 32,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  marketViewModel.isVisible ? "4.82%" : "****%",
                  style: const TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(width: 5),
                Text(
                  marketViewModel.isVisible ? "(+\$30)" : "\$**",
                  style: const TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white60),
                ),
              ],
            ),
          ],
        ));
  }
}
