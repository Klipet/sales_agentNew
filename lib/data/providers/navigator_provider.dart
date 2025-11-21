import 'package:flutter/material.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentPageIndex = 0;
  Map<String, dynamic> _pageData = {};
  PageController? _pageController;

  int get currentPageIndex => _currentPageIndex;

  // Установить PageController
  void setPageController(PageController controller) {
    _pageController = controller;
  }

  /// Переход на страницу
  void goToPage(int index) {
    if (_currentPageIndex != index) {
      print('🔄 Переход на страницу $index');
      _currentPageIndex = index;
      _pageController!.jumpToPage(index);
    }

    notifyListeners();
  }

  /// Переход на страницу с передачей данных
  void goToPageAndDestroy(int index, {Map<String, dynamic>? data}) {
    print('📤 Переход на страницу $index с данными: $data');
    if (data != null) {
      _pageData = data;
    }
    _currentPageIndex = index;
    if (_pageController != null && _pageController!.hasClients) {
        _pageController!.jumpToPage(index);
    }
    notifyListeners();
  }


  /// Переход на страницу с передачей данных
  void goToPageAndSave(int index, {Map<String, dynamic>? data}) {
    print('📤 Переход на страницу $index с данными: $data');
    if (data != null) {
      _pageData = data;
    }
    _currentPageIndex = index;
    if (_pageController != null && _pageController!.hasClients) {
      _pageController!.jumpToPage(index);
    }
    notifyListeners();
  }

  /// Обновить текущий индекс (вызывается из onPageChanged)
  void updatePageIndex(int index) {
    if (_currentPageIndex != index) {
      print('📍 Обновление индекса: $index');
      _currentPageIndex = index;
      notifyListeners();
    }
  }

  /// Получить данные страницы
  T? getPageData<T>(String key) {
    final value = _pageData[key];
    return value as T?;
  }

  /// Очистить данные страницы
  void clearPageData() {
    _pageData.clear();
  }

  @override
  void dispose() {
    _pageController = null;
    super.dispose();
  }
}
