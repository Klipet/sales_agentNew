import 'package:flutter/material.dart';

class CustomTreeNode<T> {
  final String nodeId;
  final String displayName;
  final T? nodeData;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final List<CustomTreeNode<T>> childNodes;
  final bool canExpand;
  final Map<String, dynamic>? metadata;

  CustomTreeNode({
    required this.nodeId,
    required this.displayName,
    this.nodeData,
    this.leadingWidget,
    this.trailingWidget,
    this.childNodes = const [],
    this.canExpand = false,
    this.metadata,
  });

  bool get hasChildren => childNodes.isNotEmpty;
}

/// Конфигурация внешнего вида дерева
class CustomTreeStyle {
  final double levelIndent;
  final double itemHeight;
  final EdgeInsets itemPadding;
  final EdgeInsets itemMargin;
  final BoxDecoration? itemDecoration;
  final BoxDecoration? expandedDecoration;
  final BoxDecoration? selectedDecoration;
  final BoxDecoration? hoverDecoration;
  final TextStyle? defaultTextStyle;
  final TextStyle? expandedTextStyle;
  final TextStyle? selectedTextStyle;
  final Duration animationTime;
  final Curve animationCurve;
  final Widget? expandIcon;
  final Widget? collapseIcon;
  final bool showConnectingLines;
  final Color? connectingLineColor;


  const CustomTreeStyle({
    this.levelIndent = 24.0,
    this.itemHeight = 48.0,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.itemMargin = const EdgeInsets.symmetric(vertical: 2),
    this.itemDecoration,
    this.expandedDecoration,
    this.selectedDecoration,
    this.hoverDecoration,
    this.defaultTextStyle,
    this.expandedTextStyle,
    this.selectedTextStyle,
    this.animationTime = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.expandIcon,
    this.collapseIcon,
    this.showConnectingLines = false,
    this.connectingLineColor,

  });
}

// ==================== МЕНЕДЖЕР СОСТОЯНИЯ ====================

/// Менеджер для управления состоянием дерева
class CustomTreeManager extends ChangeNotifier {
  final Map<String, bool> _expandedStates = {};
  final Map<String, bool> _selectedStates = {};
  final Map<String, dynamic> _nodeCache = {};

  // Раскрытие/сворачивание
  bool isNodeExpanded(String nodeId) => _expandedStates[nodeId] ?? false;

  void expandNode(String nodeId) {
    if (_expandedStates[nodeId] != true) {
      _expandedStates[nodeId] = true;
      notifyListeners();
    }
  }

  void collapseNode(String nodeId) {
    if (_expandedStates[nodeId] != false) {
      _expandedStates[nodeId] = false;
      notifyListeners();
    }
  }

  void toggleNodeExpansion(String nodeId) {
    _expandedStates[nodeId] = !isNodeExpanded(nodeId);
    notifyListeners();
  }

  void expandNodeWithPath(String nodeId, List<CustomTreeNode> allNodes) {
    final path = _findNodePath(nodeId, allNodes);
    for (var pathNode in path) {
      _expandedStates[pathNode] = true;
    }
    notifyListeners();
  }

  List<String> _findNodePath(String targetId, List<CustomTreeNode> nodes, [List<String> currentPath = const []]) {
    for (var node in nodes) {
      final newPath = [...currentPath, node.nodeId];
      if (node.nodeId == targetId) {
        return newPath;
      }
      if (node.hasChildren) {
        final result = _findNodePath(targetId, node.childNodes, newPath);
        if (result.isNotEmpty) return result;
      }
    }
    return [];
  }

  void expandAllNodes(List<CustomTreeNode> nodes) {
    _expandAllRecursive(nodes);
    notifyListeners();
  }

  void _expandAllRecursive(List<CustomTreeNode> nodes) {
    for (var node in nodes) {
      if (node.canExpand && node.hasChildren) {
        _expandedStates[node.nodeId] = true;
        _expandAllRecursive(node.childNodes);
      }
    }
  }

  void collapseAllNodes() {
    _expandedStates.clear();
    notifyListeners();
  }

  // Выделение
  bool isNodeSelected(String nodeId) => _selectedStates[nodeId] ?? false;

  void selectNode(String nodeId, {bool exclusive = true}) {
    if (exclusive) {
      _selectedStates.clear();
    }
    _selectedStates[nodeId] = true;
    notifyListeners();
  }

  void deselectNode(String nodeId) {
    _selectedStates.remove(nodeId);
    notifyListeners();
  }

  void toggleNodeSelection(String nodeId) {
    if (isNodeSelected(nodeId)) {
      deselectNode(nodeId);
    } else {
      selectNode(nodeId, exclusive: false);
    }
  }

  void clearAllSelections() {
    _selectedStates.clear();
    notifyListeners();
  }

  List<String> getSelectedNodeIds() {
    return _selectedStates.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
  }

  // Кэширование
  void cacheNodeData(String nodeId, dynamic data) {
    _nodeCache[nodeId] = data;
  }

  dynamic getCachedNodeData(String nodeId) {
    return _nodeCache[nodeId];
  }

  void clearCache() {
    _nodeCache.clear();
  }

  // Утилиты
  int getExpandedCount() => _expandedStates.values.where((v) => v).length;
  int getSelectedCount() => _selectedStates.values.where((v) => v).length;

  @override
  void dispose() {
    _expandedStates.clear();
    _selectedStates.clear();
    _nodeCache.clear();
    super.dispose();
  }
}

// ==================== ГЛАВНЫЙ ВИДЖЕТ ====================

/// Основной виджет дерева с полной кастомизацией
class CustomTreeWidget<T> extends StatelessWidget {
  final List<CustomTreeNode<T>> rootNodes;
  final CustomTreeManager manager;
  final CustomTreeStyle? style;

  final BorderRadius? borderRadius;
  final BoxDecoration? containerDecoration;
  final EdgeInsets? containerPadding;
  final EdgeInsets? containerMargin;

  final Widget Function(
      BuildContext context,
      CustomTreeNode<T> node,
      bool isExpanded,
      bool isSelected,
      int level,
      )? customNodeBuilder;
  final void Function(CustomTreeNode<T> node)? onNodeTap;
  final void Function(CustomTreeNode<T> node)? onNodeDoubleTap;
  final void Function(CustomTreeNode<T> node)? onNodeLongPress;
  final void Function(CustomTreeNode<T> node, bool expanded)? onNodeExpansionChanged;
  final bool enableMultiSelect;
  final ScrollController? scrollController;
  final Widget? emptyWidget;

  const CustomTreeWidget({
    Key? key,
    required this.rootNodes,
    required this.manager,
    this.style,
    this.customNodeBuilder,
    this.onNodeTap,
    this.onNodeDoubleTap,
    this.onNodeLongPress,
    this.onNodeExpansionChanged,
    this.enableMultiSelect = false,
    this.scrollController,
    this.emptyWidget,

    this.borderRadius,
    this.containerDecoration,
    this.containerPadding,
    this.containerMargin,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rootNodes.isEmpty) {
      return emptyWidget ?? const Center(child: Text('Нет данных'));
    }

    final defaultStyle = CustomTreeStyle(
      itemDecoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      expandedDecoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      selectedDecoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
      ),
      hoverDecoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      defaultTextStyle: Theme.of(context).textTheme.bodyMedium,
      expandedTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.blue.shade700,
      ),
      selectedTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      expandIcon: const Icon(Icons.chevron_right, size: 20),
      collapseIcon: const Icon(Icons.expand_more, size: 20),
    );
    final listView = AnimatedBuilder(
      animation: manager,
      builder: (context, _) {
        return ListView.builder(
          controller: scrollController,
          itemCount: _calculateVisibleNodesCount(rootNodes),
          itemBuilder: (context, index) {
            final nodeInfo = _getNodeAtIndex(rootNodes, index);
            if (nodeInfo == null) return const SizedBox.shrink();
            return _CustomTreeNodeWidget<T>(
              node: nodeInfo.node,
              level: nodeInfo.level,
              manager: manager,
              style: style ?? defaultStyle,
              customBuilder: customNodeBuilder,
              onTap: onNodeTap,
              onDoubleTap: onNodeDoubleTap,
              onLongPress: onNodeLongPress,
              onExpansionChanged: onNodeExpansionChanged,
              enableMultiSelect: enableMultiSelect,
            );
          },
        );
      },
    );
    // Если нет кастомизации, возвращаем просто ListView
    if (borderRadius == null && containerDecoration == null) {
      return listView;
    }

    // Оборачиваем в Container с округлением
    return Container(
      margin: containerMargin,
      padding: containerPadding,
      decoration: containerDecoration ??
          BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
          ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: listView,
      ),
    );
  }

  int _calculateVisibleNodesCount(List<CustomTreeNode<T>> nodes) {
    int count = 0;
    for (var node in nodes) {
      count++;
      if (manager.isNodeExpanded(node.nodeId) && node.hasChildren) {
        count += _calculateVisibleNodesCount(node.childNodes);
      }
    }
    return count;
  }

  ({CustomTreeNode<T> node, int level})? _getNodeAtIndex(
      List<CustomTreeNode<T>> nodes,
      int targetIndex, {
        int currentIndex = 0,
        int level = 0,
      }) {
    for (var node in nodes) {
      if (currentIndex == targetIndex) {
        return (node: node, level: level);
      }
      currentIndex++;

      if (manager.isNodeExpanded(node.nodeId) && node.hasChildren) {
        final result = _getNodeAtIndex(
          node.childNodes,
          targetIndex,
          currentIndex: currentIndex,
          level: level + 1,
        );
        if (result != null) return result;
        currentIndex += _calculateVisibleNodesCount(node.childNodes);
      }
    }
    return null;
  }
}

// ==================== ВНУТРЕННИЙ ВИДЖЕТ УЗЛА ====================

class _CustomTreeNodeWidget<T> extends StatefulWidget {
  final CustomTreeNode<T> node;
  final int level;
  final CustomTreeManager manager;
  final CustomTreeStyle style;
  final Widget Function(BuildContext, CustomTreeNode<T>, bool, bool, int)? customBuilder;
  final void Function(CustomTreeNode<T>)? onTap;
  final void Function(CustomTreeNode<T>)? onDoubleTap;
  final void Function(CustomTreeNode<T>)? onLongPress;
  final void Function(CustomTreeNode<T>, bool)? onExpansionChanged;
  final bool enableMultiSelect;

  const _CustomTreeNodeWidget({
    Key? key,
    required this.node,
    required this.level,
    required this.manager,
    required this.style,
    this.customBuilder,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onExpansionChanged,
    required this.enableMultiSelect,
  }) : super(key: key);

  @override
  State<_CustomTreeNodeWidget<T>> createState() => _CustomTreeNodeWidgetState<T>();
}

class _CustomTreeNodeWidgetState<T> extends State<_CustomTreeNodeWidget<T>> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isExpanded = widget.manager.isNodeExpanded(widget.node.nodeId);
    final isSelected = widget.manager.isNodeSelected(widget.node.nodeId);

    if (widget.customBuilder != null) {
      return Padding(
        padding: EdgeInsets.only(left: widget.level * widget.style.levelIndent),
        child: _buildGestureWrapper(
          widget.customBuilder!(context, widget.node, isExpanded, isSelected, widget.level),
          isExpanded,
          isSelected,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: widget.level * widget.style.levelIndent),
      child: _buildGestureWrapper(
        _buildDefaultNode(isExpanded, isSelected),
        isExpanded,
        isSelected,
      ),
    );
  }

  Widget _buildGestureWrapper(Widget child, bool isExpanded, bool isSelected) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          if (widget.node.canExpand) {
            widget.manager.toggleNodeExpansion(widget.node.nodeId);
            widget.onExpansionChanged?.call(
              widget.node,
              !isExpanded,
            );
          }
          if (widget.enableMultiSelect) {
            widget.manager.toggleNodeSelection(widget.node.nodeId);
          } else {
            widget.manager.selectNode(widget.node.nodeId);
          }
          widget.onTap?.call(widget.node);
        },
        onDoubleTap: () => widget.onDoubleTap?.call(widget.node),
        onLongPress: () => widget.onLongPress?.call(widget.node),
        child: child,
      ),
    );
  }

  Widget _buildDefaultNode(bool isExpanded, bool isSelected) {
    BoxDecoration? decoration;
    if (isSelected) {
      decoration = widget.style.selectedDecoration;
    } else if (isExpanded) {
      decoration = widget.style.expandedDecoration;
    } else if (_isHovering) {
      decoration = widget.style.hoverDecoration;
    } else {
      decoration = widget.style.itemDecoration;
    }

    TextStyle? textStyle;
    if (isSelected) {
      textStyle = widget.style.selectedTextStyle;
    } else if (isExpanded) {
      textStyle = widget.style.expandedTextStyle;
    } else {
      textStyle = widget.style.defaultTextStyle;
    }

    return AnimatedContainer(
      duration: widget.style.animationTime,
      curve: widget.style.animationCurve,
      height: widget.style.itemHeight,
      margin: widget.style.itemMargin,
      padding: widget.style.itemPadding,
      decoration: decoration,
      child: Row(
        children: [
          if (widget.node.canExpand && widget.node.hasChildren)
            AnimatedRotation(
              turns: isExpanded ? 0 : 0,
              duration: widget.style.animationTime,
              curve: widget.style.animationCurve,
              child: widget.style.expandIcon ?? const Icon(Icons.chevron_right),
            )
          else
            SizedBox(width: (widget.style.expandIcon?.runtimeType.toString().contains('Icon') ?? false) ? 20 : 24),
          const SizedBox(width: 8),
          if (widget.node.leadingWidget != null) ...[
            widget.node.leadingWidget!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              widget.node.displayName,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          if (widget.node.trailingWidget != null) ...[
            const SizedBox(width: 8),
            widget.node.trailingWidget!,
          ],
        ],
      ),
    );
  }
}