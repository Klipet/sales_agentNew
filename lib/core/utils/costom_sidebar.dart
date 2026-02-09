import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors_app.dart';
import '../styles_text.dart';

class CustomSidebarController extends ChangeNotifier {
  int _selectedIndex = 1; // начинаем с 1, т.к. 0 - это toggle button
  bool _extended = false;

  int get selectedIndex => _selectedIndex;
  bool get extended => _extended;

  void selectIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void setExtended(bool value) {
    if (_extended != value) {
      _extended = value;
      notifyListeners();
    }
  }
}

// Модель элемента сайдбара
class CustomSidebarItem {
  final Widget iconWidget;
  final String? label;
  final VoidCallback? onTap;
  final bool selectable;

  CustomSidebarItem({
    required this.iconWidget,
    this.label,
    this.onTap,
    this.selectable = true,
  });
}

// Тема для сайдбара
class CustomSidebarTheme {
  final double width;
  final EdgeInsets? padding;
  final EdgeInsets? itemTextPadding;
  final EdgeInsets? selectedItemTextPadding;
  final EdgeInsets? itemMargin;
  final EdgeInsets itemPadding;
  final EdgeInsets selectedItemPadding;
  final Decoration decoration;
  final Decoration selectedItemDecoration;
  final Decoration itemDecoration;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final TextStyle hoverTextStyle;
  final IconThemeData? iconTheme;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? hoverIconTheme;

  CustomSidebarTheme({
    required this.width,
    this.padding,
    this.itemTextPadding,
    this.selectedItemTextPadding,
    this.itemMargin,
    required this.itemPadding,
    required this.selectedItemPadding,
    required this.decoration,
    required this.selectedItemDecoration,
    required this.itemDecoration,
    required this.textStyle,
    required this.selectedTextStyle,
    required this.hoverTextStyle,
    this.iconTheme,
    this.selectedIconTheme,
    this.hoverIconTheme,
  });
}

// Главный виджет Custom Sidebar
class CustomSidebar extends StatefulWidget {
  final CustomSidebarController controller;
  final List<CustomSidebarItem> items;
  final CustomSidebarTheme? theme;
  final CustomSidebarTheme? extendedTheme;
  final Duration animationDuration;
  final Curve animationCurve;

  const CustomSidebar({
    super.key,
    required this.controller,
    required this.items,
    this.theme,
    this.extendedTheme,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  CustomSidebarTheme? _currentTheme;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _updateAnimation();
    widget.controller.addListener(_onControllerChanged);
  }

  void _updateAnimation() {
    final collapsedTheme = widget.theme;
    final expandedTheme = widget.extendedTheme;

    if (collapsedTheme != null && expandedTheme != null) {
      _widthAnimation = Tween<double>(
        begin: collapsedTheme.width,
        end: expandedTheme.width,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
      ));
    }

    if (widget.controller.extended) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _onControllerChanged() {
    if (widget.controller.extended) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    _animationController.dispose();
    super.dispose();
  }

  CustomSidebarTheme _getTheme() {
    return widget.controller.extended
        ? (widget.extendedTheme ?? widget.theme!)
        : widget.theme!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final theme = _getTheme();

        return AnimatedBuilder(
          animation: _widthAnimation,
          builder: (context, child) {
            return Container(
              width: _widthAnimation.value,
              decoration: theme.decoration,
              padding: theme.padding,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        return _buildSidebarItem(
                          context,
                          widget.items[index],
                          index,
                          theme,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSidebarItem(
      BuildContext context,
      CustomSidebarItem item,
      int index,
      CustomSidebarTheme theme,
      ) {
    final isSelected = widget.controller.selectedIndex == index && item.selectable;
    final isExtended = widget.controller.extended;

    return Padding(
      padding: theme.itemMargin ?? EdgeInsets.symmetric(vertical: 4.h),
      child: _SidebarItemWidget(
        item: item,
        isSelected: isSelected,
        isExtended: isExtended,
        theme: theme,
        onTap: () {
          if (item.onTap != null) {
            item.onTap!();
          }
          if (item.selectable) {
            widget.controller.selectIndex(index);
          }
        },
      ),
    );
  }
}

class _SidebarItemWidget extends StatefulWidget {
  final CustomSidebarItem item;
  final bool isSelected;
  final bool isExtended;
  final CustomSidebarTheme theme;
  final VoidCallback onTap;

  const _SidebarItemWidget({
    required this.item,
    required this.isSelected,
    required this.isExtended,
    required this.theme,
    required this.onTap,
  });

  @override
  State<_SidebarItemWidget> createState() => _SidebarItemWidgetState();
}

class _SidebarItemWidgetState extends State<_SidebarItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final decoration = widget.isSelected
        ? widget.theme.selectedItemDecoration
        : widget.theme.itemDecoration;

    final textStyle = widget.isSelected
        ? widget.theme.selectedTextStyle
        : _isHovered
        ? widget.theme.hoverTextStyle
        : widget.theme.textStyle;

    final itemPadding = widget.isSelected
        ? widget.theme.selectedItemPadding
        : widget.theme.itemPadding;

    final textPadding = widget.isSelected
        ? widget.theme.selectedItemTextPadding
        : widget.theme.itemTextPadding;

    // Определяем IconThemeData
    IconThemeData iconThemeData;
    if (widget.isSelected && widget.theme.selectedIconTheme != null) {
      iconThemeData = widget.theme.selectedIconTheme!;
    } else if (_isHovered && widget.theme.hoverIconTheme != null) {
      iconThemeData = widget.theme.hoverIconTheme!;
    } else if (widget.theme.iconTheme != null) {
      iconThemeData = widget.theme.iconTheme!;
    } else {
      iconThemeData = IconThemeData(color: textStyle.color);
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: itemPadding,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                data: iconThemeData,
                child: widget.item.iconWidget,
              ),
              if (widget.isExtended && widget.item.label != null) ...[
                Expanded(
                  child: Padding(
                    padding: textPadding ?? EdgeInsets.only(left: 17.r),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: widget.isExtended ? 1.0 : 0.0,
                      child: Text(
                        widget.item.label!,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Ваш класс для тем
class ListDriver {


  CustomSidebarTheme dividerSidebarXTheme(double size) {
    return CustomSidebarTheme(
      width: size.w,
      itemTextPadding: EdgeInsets.only(left: 17.r),
      selectedItemTextPadding: EdgeInsets.only(left: 17.r),
      itemPadding: EdgeInsets.all(16.r),
      selectedItemPadding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(color: containerColor),
      itemMargin: EdgeInsets.only(left: 8.r, right: 8.r, top: 20.r),
      selectedItemDecoration: BoxDecoration(
        color: colorDividerSelected,
        border: Border.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      itemDecoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      textStyle: textStyleDriver,
      selectedTextStyle: textStyleDriver,
      hoverTextStyle: textStyleDriver,
    );
  }

  CustomSidebarTheme dividerSidebarXThemeExpanded(double size) {
    return CustomSidebarTheme(
      itemMargin: EdgeInsets.only( top: 20.r),
      width: size.w,
      padding: EdgeInsets.only(left: 24.r, right: 24.r),
      itemPadding: EdgeInsets.all(15.r),
      selectedItemPadding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(color: containerColor),
      selectedItemDecoration: BoxDecoration(
        color: colorDividerSelected,
        border: Border.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      itemDecoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      textStyle: textStyleDriver,
      selectedTextStyle: textStyleDriver,
      hoverTextStyle: textStyleDriver,
      iconTheme: IconThemeData(),
      hoverIconTheme: IconThemeData(color: Colors.black),
    );
  }
}