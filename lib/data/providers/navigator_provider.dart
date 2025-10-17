

import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  // Проверяем, что PageController присоединен к PageView
  bool get isAttached => pageController.hasClients;

  void goToPage(int index) {
    if (_currentPageIndex != index && isAttached) {
      print(_currentPageIndex);
      _currentPageIndex = index;
      pageController.jumpToPage(index);
      notifyListeners();
    } else if (!isAttached) {
      // Если еще не присоединен, просто обновляем индекс
      _currentPageIndex = index;
      notifyListeners();
    }
  }

  void nextPage() {
    goToPage(_currentPageIndex + 1);
  }

  void previousPage() {
    if (_currentPageIndex > 0) {
      goToPage(_currentPageIndex - 1);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}