import 'package:flutter/material.dart';
import 'package:sales_agent/presentation/screens/create_orders_screen/select_client.dart';
import 'package:sales_agent/presentation/screens/create_orders_screen/select_address_client.dart';
import 'package:sales_agent/presentation/screens/home_screen.dart';

class AppRoutes {
  // 🔹 Константы маршрутов
  static const String home = '/';
  static const String second = '/first_step';
  static const String two = '/two_step';

  // 🔹 Генератор маршрутов
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case second:
        return MaterialPageRoute(builder: (_) => const FirstStepCreateUI());

      case two:
      // если нужно передавать аргументы:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => TwoStepCreate(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 — Страница не найдена')),
          ),
        );
    }
  }
}