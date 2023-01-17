
import 'package:flutter/cupertino.dart';

class BottomBarViewModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changePage(int value) {
    _index = value;
    notifyListeners();
  }
}
