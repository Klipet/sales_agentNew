import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/core/colors_app.dart';

class CustomSearchWidget<T> extends StatefulWidget {
  // Данные
  final List<T> items;
  final String Function(T) displayStringForOption;
  final String Function(T)? subtitleStringForOption;

  // Callbacks
  final Function(T)? onSelected;
  final VoidCallback? onClear;
  final Function(String)? onSearchChanged;

  // Параметры поиска
  final int maxSuggestions;
  final bool searchInSubtitle;

  // ============ КАСТОМИЗАЦИЯ ТЕКСТОВОГО ПОЛЯ ============
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;
  final double? borderWidth;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final EdgeInsets? suffixPadding;
  final Widget? suffixIcon;
  final double? textFieldHeight;

  // ============ КАСТОМИЗАЦИЯ ВЫПАДАЮЩЕГО СПИСКА ============
  final Color? dropdownBackgroundColor;
  final double? dropdownBorderRadius;
  final double? dropdownElevation;
  final double? dropdownMaxHeight;
  final EdgeInsets? dropdownPadding;
  final Color? dropdownShadowColor;

  // ============ КАСТОМИЗАЦИЯ ЭЛЕМЕНТОВ СПИСКА ============
  final Widget Function(T item, bool isHighlighted)? itemBuilder;
  final Color? itemHoverColor;
  final Color? itemDividerColor;
  final double? itemHeight;
  final EdgeInsets? itemPadding;
  final TextStyle? itemTitleStyle;
  final TextStyle? itemSubtitleStyle;
  final Widget Function(T)? leadingBuilder;
  final Widget Function(T)? trailingBuilder;

  // ============ АНИМАЦИЯ ============
  final Duration? animationDuration;
  final Curve? animationCurve;

  // ============ ДОПОЛНИТЕЛЬНО ============
  final bool showDividers;
  final Widget? emptyWidget;
  final bool autofocus;

  // НОВЫЙ ПАРАМЕТР: Очищать ли поле после выбора
  final bool clearAfterSelection;

  // НОВЫЙ ПАРАМЕТР: Показывать выбранный элемент как hint
  final bool showSelectedAsHint;

  // НОВЫЙ ПАРАМЕТР: Начальное выбранное значение
  final T? initialSelectedItem;

  const CustomSearchWidget({
    Key? key,
    required this.items,
    required this.displayStringForOption,
    required this.onSelected,
    this.subtitleStringForOption,
    this.onClear,
    this.onSearchChanged,
    this.maxSuggestions = 5,
    this.searchInSubtitle = true,

    // TextField кастомизация
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.borderWidth,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPadding,
    this.textFieldHeight,

    // Dropdown кастомизация
    this.dropdownBackgroundColor,
    this.dropdownBorderRadius,
    this.dropdownElevation,
    this.dropdownMaxHeight,
    this.dropdownPadding,
    this.dropdownShadowColor,

    // Item кастомизация
    this.itemBuilder,
    this.itemHoverColor,
    this.itemDividerColor,
    this.itemHeight,
    this.itemPadding,
    this.itemTitleStyle,
    this.itemSubtitleStyle,
    this.leadingBuilder,
    this.trailingBuilder,

    // Анимация
    this.animationDuration,
    this.animationCurve,

    // Дополнительно
    this.showDividers = true,
    this.emptyWidget,
    this.autofocus = false,
    this.clearAfterSelection = false,
    this.showSelectedAsHint = true,
    this.initialSelectedItem,
  }) : super(key: key);

  @override
  State<CustomSearchWidget<T>> createState() => _CustomSearchWidgetState<T>();
}

class _CustomSearchWidgetState<T> extends State<CustomSearchWidget<T>> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<T?> _selectedItemNotifier = ValueNotifier<T?>(null);
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  List<T> _filteredItems = [];
  bool _showSuggestions = false;
  int _highlightedIndex = -1;
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialSelectedItem;
    _controller.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
    // Если включён autofocus
  }

  void _onSearchChanged() {
    final query = _controller.text.toLowerCase();
    // Сбросить выбранный элемент только если поле не пустое
    if (query.isNotEmpty && _selectedItem != null) {
      setState(() {
        _selectedItem = null;
      });
    }

    if (query.isEmpty) {
      setState(() {
        _filteredItems = [];
        _showSuggestions = false;
        _highlightedIndex = -1;
      });
    } else {
      final filtered = widget.items
          .where((item) {
            final title = widget.displayStringForOption(item).toLowerCase();
            final titleMatch = title.contains(query);

            if (widget.searchInSubtitle &&
                widget.subtitleStringForOption != null) {
              final subtitle = widget.subtitleStringForOption!(item)
                  .toLowerCase();
              return titleMatch || subtitle.contains(query);
            }
            return titleMatch;
          })
          .take(widget.maxSuggestions)
          .toList();

      setState(() {
        _filteredItems = filtered;
        _showSuggestions = filtered.isNotEmpty;
        _highlightedIndex = -1; // Сбросить подсветку при новом поиске
      });
    }
    widget.onSearchChanged?.call(_controller.text);
    _updateOverlay();
  }

  void _onFocusChanged() {
      if (_controller.text.isNotEmpty && _filteredItems.isNotEmpty) {
        _updateOverlay();
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);

  }

  void _updateOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
    } else {
      // Создаем новый только если его нет
      _showOverlay();
    }
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
  }

  void _selectItem(T item) {
    // 1. Вызываем onSelected СНАЧАЛА. Это инициирует навигацию (dispose текущего виджета).
    widget.onSelected?.call(item);

    // 2. Проверяем, не был ли виджет удален из дерева во время навигации.
    // Если виджет был удален, 'mounted' будет false, и мы безопасно пропустим setState().
    if (mounted) {
      // 3. Если виджет все еще существует, обновляем локальное состояние.
      setState(() {
        _selectedItem = item;
        _highlightedIndex = -1;
        _showSuggestions = false;
        _filteredItems = [];
      });

      if (widget.clearAfterSelection) {
        _controller.clear();
      } else {
        _controller.text = widget.displayStringForOption(item);
      }

      _hideOverlay();
    }
  }

  String _getHintText() {
    return widget.hintText ?? 'Поиск...';
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: widget.dropdownElevation ?? 8.0,
            borderRadius: BorderRadius.circular(
              widget.dropdownBorderRadius ?? 8.r,
            ),
            shadowColor: widget.dropdownShadowColor ?? Colors.black26,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: widget.dropdownMaxHeight ?? 250.h,
              ),
              padding: widget.dropdownPadding ?? EdgeInsets.zero,
              decoration: BoxDecoration(
                color: widget.dropdownBackgroundColor ?? Colors.white,
                borderRadius: BorderRadius.circular(
                  widget.dropdownBorderRadius ?? 8.r,
                ),
              ),
              child: _filteredItems.isEmpty && widget.emptyWidget != null
                  ? widget.emptyWidget!
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _filteredItems.length,
                      separatorBuilder: (context, index) {
                        if (!widget.showDividers) return SizedBox.shrink();
                        return Divider(
                          height: 1,
                          color: widget.itemDividerColor ?? Colors.grey[300],
                        );
                      },
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        final isHighlighted = index == _highlightedIndex;
                        // Если есть кастомный itemBuilder
                        if (widget.itemBuilder != null) {
                          return InkWell(
                            onTap: () => {_selectItem(item)},
                            onHover: (hover) {
                              setState(() {
                                _highlightedIndex = hover ? index : -1;
                              });
                            },
                            child: widget.itemBuilder!(item, isHighlighted),
                          );
                        }
                        // Стандартный вид
                        return InkWell(
                          onTap: () {
                            _selectItem(item);
                          },

                          onHover: (hover) {
                            setState(() {
                              _highlightedIndex = hover ? index : -1;
                            });
                          },
                          child: Container(
                            height: widget.itemHeight,
                            padding:
                                widget.itemPadding ??
                                EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                            color: isHighlighted
                                ? (widget.itemHoverColor ?? Colors.grey[100])
                                : Colors.transparent,
                            child: Row(
                              children: [
                                if (widget.leadingBuilder != null) ...[
                                  widget.leadingBuilder!(item),
                                  SizedBox(width: 12.w),
                                ],
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.displayStringForOption(item),
                                        style:
                                            widget.itemTitleStyle ??
                                            TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      if (widget.subtitleStringForOption !=
                                          null) ...[
                                        Spacer(),
                                        Text(
                                          widget.subtitleStringForOption!(item),
                                          style:
                                              widget.itemSubtitleStyle ??
                                              TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey[600],
                                              ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                if (widget.trailingBuilder != null) ...[
                                  SizedBox(width: 12.w),
                                  widget.trailingBuilder!(item),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        height: widget.textFieldHeight,
        child: TextField(
          keyboardType: TextInputType.text,
        //  key: ValueKey(_selectedItem),
          controller: _controller,
          focusNode: _focusNode,
          autofocus: true, //widget.autofocus,
          style: widget.textStyle ?? TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: _getHintText(),
            hintStyle: widget.hintStyle ?? TextStyle(color: Colors.grey[400]),
            prefixIcon: widget.prefixIcon,
            suffixIcon: _controller.text.isNotEmpty || _selectedItem != null
                ? Padding(
                    padding: widget.suffixPadding ?? EdgeInsets.zero,
                    child:
                        widget.suffixIcon ??
                        IconButton(
                          icon: Icon(Icons.clear, size: 20.r),
                          onPressed: () {
                            _controller.clear();
                            setState(() {
                              _selectedItem = null;
                            });
                            widget.onClear?.call();
                          },
                        ),
                  )
                : (widget.suffixIcon != null
                      ? Padding(
                          padding: widget.suffixPadding ?? EdgeInsets.zero,
                          child: InkWell(
                            onLongPress: () {
                              _controller.clear();
                            },
                            onTap: () {
                              _controller.clear();
                              setState(() {
                                _selectedItem = null;
                              });
                            },
                            child: widget.suffixIcon,
                          ),
                        )
                      : null),
            filled: widget.fillColor != null,
            fillColor: widget.fillColor ?? Colors.grey[100],
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
                width: widget.borderWidth ?? 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
                width: widget.borderWidth ?? 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
              borderSide: BorderSide(
                color: widget.focusedBorderColor ?? Colors.grey,
                width: widget.borderWidth ?? 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _focusNode.removeListener(_onFocusChanged);
    _controller.dispose();
    _focusNode.dispose();
    _selectedItemNotifier.dispose();

    // Сначала удаляем overlay, потом dispose
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry?.dispose();
      _overlayEntry = null;
    }
    super.dispose();
  }
}
