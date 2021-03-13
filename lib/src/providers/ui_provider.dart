class UIProvider {
  static int _selectedIndex;

  UIProvider();

  set selectedIndex(int i) {
    this.selectedIndex = i;
  }

  get selectedIndex => _selectedIndex;
}
