part of 'package:crypto_app/view/wallet/wallet_view.dart';

class _GridView extends StatelessWidget {
  const _GridView({required this.walletViewModel});
  final WalletViewModel walletViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: MasonryGridView.count(
          itemCount: walletViewModel.appWallet.length,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height:
                      walletViewModel.appWallet[index].amount > 1 ? 170 : 130,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          walletViewModel.appWallet[index].symbol
                              .toString()
                              .replaceAll("USDT", ""),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Column(
                          children: [
                            const Text(
                              "Amount:",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              walletViewModel.appWallet[index].amount
                                  .toString()
                                  .substring(0, 4),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 15,
                  child: coinLogos
                          .contains(walletViewModel.appWallet[index].symbol)
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              'assets/logo/${walletViewModel.appWallet[index].symbol}.png'))
                      : SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            'assets/logo/UNKNOWN.png',
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
