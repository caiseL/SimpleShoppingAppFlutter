import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  set selectedIndex(int i) {
    this.selectedIndex = i;
    notifyListeners();
  }

  int get selectedIndex {
    return this._selectedIndex;
  }
}
