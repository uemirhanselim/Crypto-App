import 'package:crypto_app/view/market/market_view.dart';
import 'package:crypto_app/view/wallet/wallet_view.dart';
import 'package:crypto_app/view_model/bottom_bar_view_model.dart';
import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  final List<Widget> pages = [
    const MarketView(),
    const WalletView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarViewModel()),
        ChangeNotifierProvider(create: (context) => MarketViewModel()),
      ],
      builder: (context, child) {
        return Consumer<BottomBarViewModel>(
          builder: (context, bottomBarViewModel, child) {
            return Scaffold(
              body: pages[bottomBarViewModel.index],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color.fromARGB(255, 114, 167, 161),
                elevation: 0,
                currentIndex: bottomBarViewModel.index,
                selectedIconTheme:
                    const IconThemeData(color: Colors.white, size: 26),
                unselectedIconTheme:
                    const IconThemeData(color: Colors.white, size: 26),
                selectedFontSize: 15,
                unselectedFontSize: 14,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600),
                selectedItemColor: Colors.white,
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600),
                unselectedItemColor: Colors.white,
                onTap: (value) {
                  bottomBarViewModel.changePage(value);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.wallet_1), label: "Wallet"),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
