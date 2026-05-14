import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:sales_agent/data/models_api/models_client_prices/price_lists.dart';
import 'package:sales_agent/data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../core/utils/asl_table_util.dart';
import '../../data/models_api/models_client_prices/prices.dart';
import '../../data/repositories/assortiment_repositori.dart';
import '../../packages/custom_tree_package.dart';

class TableAssortimentWidghet extends StatefulWidget {
  final void Function(ModelAssortimentDB, {Prices? priceSelected})? onItemSelected;
  final String search;
  final List<PriceLists>? clientPrices; // 🔥 ДОБАВИЛИ - список прайсов клиента


  const TableAssortimentWidghet({
    super.key,
    this.onItemSelected,
    required this.search,
    this.clientPrices,
  });

  @override
  State<TableAssortimentWidghet> createState() =>
      _TableAssortimentWidghetState();
}

class _TableAssortimentWidghetState extends State<TableAssortimentWidghet> {
  late final CustomTreeManager _manager;
  Map<String, List<ModelAssortimentDB>> folderMap = {};
  bool isLoading = true;
  Map<String, double> clientPrices = {};
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _manager = CustomTreeManager();
    _loadData();
  }

  @override
  void dispose() {
    _manager.dispose();
    _isMounted = false; // ✅ Предотвращаем setState после dispose
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant TableAssortimentWidghet oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 🔥 Проверяем, изменился ли параметр search
    if (oldWidget.search != widget.search) {
      _loadData();
    }
    else if (oldWidget.clientPrices != widget.clientPrices) {
      // ✅ Убираем пустой setState, обновляем только если нужно
      if (_isMounted) {
        setState(() {
          // Логика обновления цен, если нужна
        });
      }
    }
  }


  Future<void> _loadData() async {
    var searchQuery;
    try {
      final AssortimentRepositori repo = AssortimentRepositori();
      setState(() {
        searchQuery = widget.search;
      });
      final data = await repo.searchAssortiment(searchQuery);
      data.sort((a,b) => a.name!.compareTo(b.name!));
    //  print(widget.search);
      final map = <String, List<ModelAssortimentDB>>{};
      for (var item in data) {
        // Обрабатываем все варианты parentUid
        final key = item.parentUid ?? '';
        map.putIfAbsent(key, () => []);
        map[key]!.add(item);
      }
      setState(() {
        folderMap = map;
        isLoading = false;
      });
    } catch (e) {
      print('Ошибка загрузки: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  CustomTreeNode<ModelAssortimentDB> _modelToNode(ModelAssortimentDB model) {
    final isFolder = model.isFolder ?? false;
    final children = isFolder
        ? (folderMap[model.uid] ?? [])
              .map((child) => _modelToNode(child))
              .toList()
        : <CustomTreeNode<ModelAssortimentDB>>[];

    return CustomTreeNode<ModelAssortimentDB>(
      nodeId: model.uid ?? model.id.toString(),
      displayName: model.name ?? 'Без названия',
      nodeData: model,
      canExpand: isFolder,
      childNodes: children,
      trailingWidget: !isFolder && model.price != null
          ? Chip(
              label: Text('${model.price?.toStringAsFixed(2)} ₽'),
              backgroundColor: Colors.green.shade50,
              padding: EdgeInsets.zero,
            )
          : null,
      metadata: {
        'barCode': model.barCode,
        'code': model.code,
        'remain': model.remain,
        'price': model.price,
      },
    );
  }

  List<CustomTreeNode<ModelAssortimentDB>> _buildTreeNodes({
    bool onlyProducts = false,
    bool onlyFolders = false,
  }) {
    final allData = folderMap.values.expand((list) => list).toList();

    // Находим корневые элементы
    var rootItems = allData.where((item) {
      return item.parentUid == null ||
          item.parentUid == '00000000-0000-0000-0000-000000000000' ||
          item.parentUid?.isEmpty == true ||
          item.parentUid == 'null';
    }).toList();

    // Применяем фильтры (если не указаны оба одновременно)
    if (onlyProducts && !onlyFolders) {
      rootItems = rootItems.where((item) => item.isFolder == false).toList();
    } else if (onlyFolders && !onlyProducts) {
      rootItems = rootItems.where((item) => item.isFolder == true).toList();
    }

    // Fallback на все данные с учетом фильтра
    if (rootItems.isEmpty) {
      if (onlyProducts) {
        rootItems = allData.where((item) => item.isFolder == false).toList();
      } else if (onlyFolders) {
        rootItems = allData.where((item) => item.isFolder == true).toList();
      } else {
        rootItems = allData;
      }
    }

    return rootItems.map((item) => _modelToNode(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (folderMap.isEmpty) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/empti.svg', width: 446.w, height: 259.h),
                    SizedBox(height: 16),
                    Text(
                      'errors.notFound'.tr(),
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    final corporateStyle = CustomTreeStyle(
      levelIndent: 47.w,
      itemHeight: 48.h,
      itemPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      itemMargin: EdgeInsets.zero,

      itemDecoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor, width: 1.w),
      ),

      expandedDecoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor, width: 1.w),
      ),

      selectedDecoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor, width: 1.w),
      ),

      hoverDecoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor, width: 1.w, ),
          borderRadius: BorderRadius.all(Radius.circular(15.r))
      ),

      defaultTextStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      expandedTextStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      selectedTextStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      showConnectingLines: false,
      collapseIcon: SvgPicture.asset(
        'assets/icons/assortiment/folder_open.svg',
      ),
      expandIcon: SvgPicture.asset('assets/icons/assortiment/folder_open.svg'),
    );

    return Scaffold(
      body:CustomTreeWidget<ModelAssortimentDB>(
          rootNodes: _buildTreeNodes(),
          manager: _manager,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
          style: corporateStyle,
          customNodeBuilder: (context, node, isExpanded, isSelected, level) {
            final specialPrice = _getSpecialPrice(node.nodeData!);
            return Container(
              decoration: BoxDecoration(
                color: isSelected ? selectedColor : containerColor,
                border: Border.all(color: borderColor, width: 1.w),
              ),
              height: 50.h,
              width: double.maxFinite,
              child: Row(
                children: [
                  node.nodeData!.isFolder!
                  // Папки
                      ? !isSelected ? folderStandart(isSelected: isSelected,node: node ) : selectedFolder( context: context, isSelected: isSelected, node: node)
                  //  ассортимент
                      : aslContentWidget( specialPrice ?? '', isSelected: isSelected, node: node, )
                ],
              ),
            );
          },
          onNodeTap: (node) {
            // Вызываем колбэк при выборе товара
            if (node.nodeData != null && !(node.nodeData!.isFolder ?? false)) {
              final priceData = _getSpecialPriceSelect(node.nodeData!);
              widget.onItemSelected?.call(node.nodeData!, priceSelected: priceData);
            }
          },
        ),
    );
  }

  String? _getSpecialPrice(ModelAssortimentDB item) {
    try {

      // Проходим по каждому PriceListModel
      for (final priceList in widget.clientPrices!) {
        // Ищем внутри него нужный AssortimentUid
        final entry = priceList.lines.firstWhere(
              (p) => p.assortimentUid == item.uid,
        );
        if (entry.price != 0) {
          return entry.price.toStringAsFixed(2);
        }
      }
    } catch (_) {
      // Игнорируем ошибки
    }
    return null;
  }

  Prices? _getSpecialPriceSelect(ModelAssortimentDB item) {
    try {
      // Проходим по каждому PriceListModel
      for (final priceList in widget.clientPrices!) {


        // Ищем внутри него нужный AssortimentUid
        final entry = priceList.lines.firstWhere(
              (p) => p.assortimentUid == item.uid,
        );
     //   print(entry);
        if (entry.price != 0) {
          return entry;
        }
      }
    } catch (_) {
      // Игнорируем ошибки
    }
    return null;
  }
}
