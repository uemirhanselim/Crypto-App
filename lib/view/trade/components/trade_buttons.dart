part of 'package:crypto_app/view/trade/trade_view.dart';

class _TradeButtons extends StatelessWidget {
  const _TradeButtons(
      {required this.index,
      required this.symbol,
      required this.tradeViewModel,
      required this.marketViewModel,
      required this.walletViewModel});
  final int index;
  final String symbol;
  final TradeViewModel tradeViewModel;
  final MarketViewModel marketViewModel;
  final WalletViewModel walletViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _tradeButton(context, "Sell"),
        _tradeButton(context, "Buy"),
      ],
    );
  }

  InkWell _tradeButton(BuildContext context, String label) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Dialog(
                backgroundColor: Colors.white.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0,
                child: label == "Buy"
                    ? _dialogContentBuy(context)
                    : _dialogContentSell(context),
              ),
            );
          },
        );
      },
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _dialogContentSell(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MarketViewModel(),
      child: Container(
        height: 260,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Your Balance: \$${walletViewModel.totalBalance.toString()}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: tradeViewModel.controller,
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Iconsax.dollar_circle),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: marketViewModel.getMarketData(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Market> market = snapshot.data;
                          return InkWell(
                            onTap: () {
                              num aa = 0;
                              for (var element in walletViewModel.appWallet) {
                                if (element.symbol == symbol &&
                                    element.amount > 0 &&
                                    element.price > 0) {
                                  element.amount -= double.parse(
                                      tradeViewModel.controller.text);
                                  element.price -= (element.amount *
                                      double.parse(market[index].lastPrice));
                                }
                                aa -= element.price;
                              }

                              walletViewModel.changeTotalBalance(aa);

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Transaction Success")));
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Text(
                                  "Sell",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dialogContentBuy(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: tradeViewModel.controller,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Iconsax.dollar_circle),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: marketViewModel.getMarketData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Market> market = snapshot.data;
                        return InkWell(
                          onTap: () {
                            if (walletViewModel.totalBalance >=
                                double.parse(tradeViewModel.controller.text)) {
                              double amount =
                                  double.parse(tradeViewModel.controller.text) /
                                      double.parse(market[index].lastPrice);

                              if (!walletViewModel.appWallet.any((element) =>
                                  element.symbol == market[index].symbol)) {
                                walletViewModel.appWallet.add(Wallet(
                                    market[index].symbol,
                                    amount,
                                    (amount *
                                        double.parse(
                                            market[index].lastPrice))));
                              } else {
                                for (int i = 0;
                                    i < walletViewModel.appWallet.length;
                                    i++) {
                                  if (market[index].symbol ==
                                      walletViewModel.appWallet[i].symbol) {
                                    walletViewModel.appWallet[i].amount +=
                                        amount;
                                    walletViewModel.changeTotalBalance((amount *
                                        double.parse(market[index].lastPrice)));
                                  }
                                }
                              }
                              num aa = 0;
                              for (var e in walletViewModel.appWallet) {
                                aa += e.price;
                              }
                              walletViewModel.changeTotalBalance(aa);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Transaction Success")));
                            } else {
                              Navigator.pop(context);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Transaction Failed! Unsufficent balance")));
                            }
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                "Buy",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
