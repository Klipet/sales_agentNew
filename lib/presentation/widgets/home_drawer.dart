import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/presentation/screens/assortiment_screen.dart';
import 'package:sales_agent/presentation/screens/clients_screen.dart';
import 'package:sales_agent/presentation/widgets/list_driver.dart'
    hide ListDriver;
import 'package:sidebarx/sidebarx.dart';

import '../../core/utils/costom_sidebar.dart';
import '../../data/providers/navigator_provider.dart';
import '../screens/create_orders_screen/first_step_create.dart';
import '../screens/create_orders_screen/two_step_create.dart';
import '../screens/home_screen.dart';
import '../screens/orders_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer>
    with SingleTickerProviderStateMixin {
  late CustomSidebarController _controller;
  final PageController _pageController = PageController(initialPage: 0);
  late NavigationProvider _navigationProvider;

  @override
  void initState() {
    super.initState();
    _controller = CustomSidebarController();
    // Слушаем изменения в SidebarX
//    _controller.addListener(() {
//      if (_controller.selectedIndex >= 1) {
//        // Игнорируем первую кнопку (шеврон)
//        int pageIndex = _controller.selectedIndex - 1;
//        if (pageIndex != _pageController.page?.round()) {
//          _pageController.jumpToPage(pageIndex);
//        }
//      }
//      setState(() {});
//    });
//
//    // Слушаем изменения в PageView (если нужно синхронизировать обратно)
//    _pageController.addListener(() {
//      final page = _pageController.page?.round() ?? 0;
//      if (_controller.selectedIndex != page + 1) {
//        _controller.selectIndex(page + 1);
//      }
//    });

    // Инициализируем после построения виджета
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigationProvider = Provider.of<NavigationProvider>(context, listen: false);

      // Слушаем изменения в Sidebar
      _controller.addListener(() {
        if (_controller.selectedIndex >= 1) {
          // Игнорируем первую кнопку (шеврон)
          int pageIndex = _controller.selectedIndex - 1;
          _navigationProvider.goToPage(pageIndex);
        }
        if (mounted) setState(() {});
      });

      // Слушаем изменения в NavigationProvider
      _navigationProvider.addListener(() {
        final page = _navigationProvider.currentPageIndex;
        if (_controller.selectedIndex != page + 1) {
          _controller.selectIndex(page + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          ClipRect(
            // обязательно для BackdropFilter
            child: Stack(
              children: [
                PageView(
                  controller: navigationProvider.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {

                  },
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        right: 24.w,
                        left: 100.w,
                      ),
                      child: HomeScreen(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: OrdersScreen(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: ClientsScreen(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: AssortimentScreen(),
                    ),
                    HomeScreen(),
                    HomeScreen(),

                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: FirstStepCreate(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: TwoStepCreate(),
                    ),

                    // HistoryScreen(),
                    // SettingsScreen(),
                  ],
                ),

                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    if (_controller.extended) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: GestureDetector(
                          onTap: () {
                            // Закрываем сайдбар при клике на backdrop
                            _controller.setExtended(false);
                          },
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          CustomSidebar(
            controller: _controller,
            theme: ListDriver().dividerSidebarXTheme(104),
            extendedTheme: ListDriver().dividerSidebarXThemeExpanded(239),
            items: [
              // Toggle button
              CustomSidebarItem(
                iconWidget: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Icon(
                      _controller.extended
                          ? Icons.chevron_left
                          : Icons.chevron_right,
                      size: 24.r,
                    );
                  },
                ),
                onTap: () {
                  _controller.setExtended(!_controller.extended);
                },
                selectable: false,
              ),
              // Home
              CustomSidebarItem(
                iconWidget: SvgPicture.asset(
                  'assets/icons/drawers/home.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                label: 'driver.home'.tr(),
              ),
              // Orders
              CustomSidebarItem(
                iconWidget: SvgPicture.asset(
                  'assets/icons/drawers/orders.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                label: 'driver.orders'.tr(),
              ),
              // Clients
              CustomSidebarItem(
                iconWidget: SvgPicture.asset(
                  'assets/icons/drawers/contragents.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                label: 'driver.client'.tr(),
              ),
              // Assortiment
              CustomSidebarItem(
                iconWidget: SvgPicture.asset(
                  'assets/icons/drawers/assortiment.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                label: 'driver.asl'.tr(),
              ),
              // History
              CustomSidebarItem(
                iconWidget: SvgPicture.asset(
                  'assets/icons/drawers/history.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                label: 'driver.history'.tr(),
              ),
              // Settings
              CustomSidebarItem(
                iconWidget: SvgPicture.asset(
                  'assets/icons/drawers/settings.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                label: 'driver.setting'.tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
