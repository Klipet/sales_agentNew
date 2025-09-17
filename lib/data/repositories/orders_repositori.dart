import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_api/models_documents/model_lines.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';

import '../models_api/models_documents/model_documents.dart';

import 'db_provider.dart';

class OrdersRepositori {

  Future<void> saveOrders(ModelDocuments modelDoc) async {
    final isar = await DbProvider.instance();
    final db = ModelDocumentDb(
      clientName: modelDoc.clientName,
      clientUid: modelDoc.clientUid,
      code: modelDoc.code,
      comment: modelDoc.comment,
      dateProcessed: modelDoc.dateProcessed,
      dateValid: modelDoc.dateValid,
      deliveryAddress: modelDoc.deliveryAddress,
      state: modelDoc.state,
      stockName: modelDoc.stockName,
      stockUid: modelDoc.stockUid,
      sum: modelDoc.sum,
      uid: modelDoc.uid,
    );
    final linesDB = modelDoc.lines.map((lines) {
      return ModelLinesDb(
        assortimentBarcode: lines.assortimentBarcode,
        assortimentCode: lines.assortimentCode,
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
}