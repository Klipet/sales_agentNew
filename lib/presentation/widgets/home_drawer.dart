import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/presentation/screens/assortiment_screen.dart';
import 'package:sales_agent/presentation/screens/clients_screen.dart';
import 'package:sales_agent/presentation/screens/create_orders_screen/add_asl_to_order.dart';
import 'package:sales_agent/presentation/widgets/list_driver.dart'
    hide ListDriver;
import 'package:sidebarx/sidebarx.dart';

import '../../core/utils/costom_sidebar.dart';
import '../../data/providers/navigator_provider.dart';
import '../screens/create_orders_screen/select_client.dart';
import '../screens/create_orders_screen/order_info.dart';
import '../screens/create_orders_screen/select_address_client.dart';
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
  late PageController _pageController;
  late NavigationProvider _navigationProvider;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = CustomSidebarController();
    _pageController = PageController(initialPage: 0);

    // Инициализируем после построения виджета
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _navigationProvider = Provider.of<NavigationProvider>(
        context,
        listen: false,
      );

      // Передаем PageController в NavigationProvider
      _navigationProvider.setPageController(_pageController);

      // Слушаем изменения в Sidebar
      _controller.addListener(_onSidebarChanged);

      // Слушаем изменения в NavigationProvider
      _navigationProvider.addListener(_onNavigationChanged);

      _isInitialized = true;
    });
  }

  void _onSidebarChanged() {
    if (!_isInitialized || !mounted) return;

    if (_controller.selectedIndex >= 1) {
      // Игнорируем первую кнопку (шеврон)
      int pageIndex = _controller.selectedIndex - 1;

      // Используем NavigationProvider для перехода
      if (pageIndex != _navigationProvider.currentPageIndex) {
        _navigationProvider.goToPage(pageIndex);
      }
    }

    if (mounted) setState(() {});
  }

  void _onNavigationChanged() {
    if (!_isInitialized || !mounted) return;

    final page = _navigationProvider.currentPageIndex;

    // Синхронизируем Sidebar с текущей страницей
    if (_controller.selectedIndex != page + 1) {
      _controller.selectIndex(page + 1);
    }

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onSidebarChanged);
    if (_isInitialized) {
      _navigationProvider.removeListener(_onNavigationChanged);
    }
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
                  //  IndexedStack(
                  //  index: navigationProvider.currentPageIndex,
                  controller: _pageController,
                  //.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    // Обновляем индекс в Provider
                    navigationProvider.updatePageIndex(index);
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
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: FreeStepCreate(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 100.w),
                      child: AddAslToOrder(),
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
