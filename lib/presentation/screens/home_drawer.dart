import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/presentation/widgets/list_driver.dart';
import 'package:sidebarx/sidebarx.dart';

import 'home_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer>
    with SingleTickerProviderStateMixin {
  final _controller = SidebarXController(selectedIndex: 1, extended: false);
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Expanded только для PageView
          ClipRect(
            // обязательно для BackdropFilter
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        right: 24.w,
                        left: 100.w,
                      ),
                      child: HomeScreen(),
                    ),
                    // OrdersScreen(),
                    // ClientsScreen(),
                    // AssortimentScreen(),
                    // HistoryScreen(),
                    // SettingsScreen(),
                  ],
                ),
                if (_controller.extended)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(
                        0,
                      ), // нужен для BackdropFilter
                    ),
                  ),
              ],
            ),
          ),
          Container(
            child: SidebarX(
              controller: _controller,
              theme: ListDriver().dividerSidebarXTheme(115),
              extendedTheme: ListDriver().dividerSidebarXThemeExpanded(239),
              showToggleButton: false,
              items: [
                SidebarXItem(
                  iconWidget: Icon(
                    _controller.extended
                        ? Icons.chevron_left
                        : Icons.chevron_right,
                    size: 24.r,),
                  onTap: () {
                    _controller.setExtended(!_controller.extended);
                  },
                  selectable: false,
                ),
                SidebarXItem(
                  iconWidget:
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/drawers/home.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                  label: 'driver.home'.tr(),
                ),
                SidebarXItem(
                  iconWidget: SvgPicture.asset(
                    'assets/icons/drawers/orders.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'driver.orders'.tr(),
                ),
                SidebarXItem(
                  iconWidget: SvgPicture.asset(
                    'assets/icons/drawers/contragents.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'driver.client'.tr(),
                ),
                SidebarXItem(
                  iconWidget: SvgPicture.asset(
                    'assets/icons/drawers/assortiment.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'driver.asl'.tr(),
                ),
                SidebarXItem(
                  iconWidget: SvgPicture.asset(
                    'assets/icons/drawers/history.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'driver.history'.tr(),
                ),
                SidebarXItem(
                  iconWidget: SvgPicture.asset(
                    'assets/icons/drawers/settings.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'driver.setting'.tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
