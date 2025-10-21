

import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentPageIndex = 0;
  final Set<int> _builtPages = {0}; // Страницы, которые построены в памяти

  int get currentPageIndex => _currentPageIndex;

  /// Переход на страницу с сохранением текущей в памяти
  void goToPage(int index) {
    if (_currentPageIndex != index) {
      print('Переход на страницу $index (текущая $_currentPageIndex остается в памяти)');
      _currentPageIndex = index;
      _builtPages.add(index);
      notifyListeners();
    }
  }

  /// Переход на страницу с удалением текущей из памяти
  void goToPageAndDestroy(int index) {
    if (_currentPageIndex != index) {
      print('Переход на страницу $index (страница $_currentPageIndex удаляется из памяти)');
      final oldIndex = _currentPageIndex;
      _currentPageIndex = index;
      _builtPages.remove(oldIndex); // Удаляем старую страницу из памяти
      _builtPages.add(index);
      notifyListeners();
    }
  }

  /// Удалить конкретную страницу из памяти
  void destroyPage(int index) {
    if (index != _currentPageIndex) {
      print('Удаление страницы $index из памяти');
      _builtPages.remove(index);
      notifyListeners();
    }
  }

  /// Очистить все страницы кроме текущей
  void clearAllExceptCurrent() {
    print('Очистка всех страниц кроме $_currentPageIndex');
    _builtPages.clear();
    _builtPages.add(_currentPageIndex);
    notifyListeners();
  }

  /// Проверка, построена ли страница
  bool shouldBuildPage(int index) {
    return _builtPages.contains(index);
  }

  /// Получить список построенных страниц (для отладки)
  Set<int> get builtPages => Set.unmodifiable(_builtPages);
}