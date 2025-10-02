import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_api/models_documents/model_lines.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';

import '../../core/utils/convert_data.dart';
import '../../core/utils/order_data_source.dart';
import '../models_api/models_documents/model_documents.dart';

import 'db_provider.dart';

class OrdersRepositori {

  Future<void> saveOrders(ModelDocuments modelDoc) async {
    final isar = await DbProvider.instance();
    final db = ModelDocumentDb(
      clientName: modelDoc.clientName ?? '',
      clientUid: modelDoc.clientUid ?? '',
      code: modelDoc.code ?? '',
      comment: modelDoc.comment,
      dateProcessed: modelDoc.dateProcessed,
      dateValid: ConvertData().convertDate(modelDoc.dateValid),
      deliveryAddress: modelDoc.deliveryAddress,
      state: modelDoc.state,
      stockName: modelDoc.stockName,
      stockUid: modelDoc.stockUid,
      sum: modelDoc.sum,
      uid: modelDoc.uid,
    );
    final linesDB = modelDoc.lines.map((lines) {
      return ModelLinesDb(
        assortimentBarcode: lines.assortimentBarcode ?? '',
        assortimentCode: lines.assortimentCode ?? '',
        assortimentName: lines.assortimentName,
        assortimentUid: lines.assortimentUid,
        count: lines.count,
        lineNumber: lines.lineNumber,
        price: lines.price,
        processedCount: lines.processedCount,
        sum: lines.sum,
        uid: lines.uid,
        unitName: lines.unitName,
        unitUid: lines.unitUid,
      );
    }).toList();

    await isar.writeTxn(() async {
      await isar.modelDocumentDbs.put(db); // сначала документ
      await isar.modelLinesDbs.putAll(linesDB); // потом строки

      // связываем через IsarLinks
      db.lines.addAll(linesDB);
      await db.lines.save();
    });
  }

  Future<int> getOrdersCountByState(int state) async {
    final isar = await DbProvider.instance();

    final count = await isar.modelDocumentDbs
        .filter()
        .stateEqualTo(state) // фильтр по статусу
        .count();

    return count;
  }

Future<List<ModelDocumentDb>> getOrders() async{
  final isar = await DbProvider.instance();
  final orders = await isar.modelDocumentDbs.where().findAll();
  return orders;
}

  Future<void> deleteOrder() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelDocumentDbs.clear());
  }

  Future<void> deleteLine() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelLinesDbs.clear());
  }

  Future<Map<DateTime, List<int>>> loadOrdersGroupedByDate() async {
    final isar = await DbProvider.instance();

    // Загружаем только нужные документы (state = 1 или 2)
    final docs = await isar.modelDocumentDbs
        .filter()
        .stateEqualTo(1)
        .or()
        .stateEqualTo(2)
        .findAll();

    final Map<DateTime, List<int>> grouped = {};

    for (var doc in docs) {
      DateTime dataDoc = doc.dateValid;
      final date = DateTime(dataDoc.year, dataDoc.month, dataDoc.day);

      grouped.putIfAbsent(date, () => []);
      grouped[date]!.add(doc.state);
    }

    print('loadOrdersGroupedByDate: $grouped');
    return grouped;
  }

  Future<List<ModelDocumentDb>> loadOrdersForDay(DateTime day) async {
    final isar = await DbProvider.instance();
    print(day);
    final start = day;

    final end = day.add(Duration(days: 1));

    // получаем документы в диапазоне конкретного дня
    return await isar.modelDocumentDbs
        .filter()
        .dateValidBetween(start, end)
        .stateBetween(1, 2)
        .findAll();
  }

  Future<List<ModelLinesDb>> loadOrdersLine(ModelDocumentDb order) async {

    // нужно загрузить связи явно
    await order.lines.load();

    return order.lines.toList();
  }


  Future<List<ModelDocumentDb>> filterOrders(int status) async {
    final isar = await DbProvider.instance();
    final orders = await isar.modelDocumentDbs
        .filter()
        .stateEqualTo(status) // тут твой фильтр
        .findAll();
    return orders;
  }


  Future<List<ModelDocumentDb>> filterOrdersCount( String searchQuery,) async {
    final isar = await DbProvider.instance();

    List<ModelDocumentDb> orders;
      // Получить все заказы
      orders = await isar.modelDocumentDbs.where().findAll();
    // Поиск по тексту в памяти
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      orders = orders.where((order) {
        return (order.code.toLowerCase().contains(query) ?? false) ||
            (order.clientName?.toLowerCase().contains(query) ?? false) ||
            (order.comment?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    return orders;
  }
}