import 'package:flutter/cupertino.dart';

import '../model/wallet.dart';

class WalletViewModel extends ChangeNotifier {
  num _totalBalance = 110;
  final List<Wallet> _appWallet = [];

  num get totalBalance => _totalBalance;

  List<Wallet> get appWallet => _appWallet;

  void changeTotalBalance(num newBalance) {
    _totalBalance += newBalance;
    notifyListeners();
  }
}