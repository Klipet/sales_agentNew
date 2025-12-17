import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_api/models_client/ourlets_response.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';
import 'package:uuid/uuid.dart';

import '../models_api/models_client_prices/prices.dart';
import '../models_db/model_db_assortiment/model_assortiment_db.dart';
import '../models_db/model_db_clients/model_client_db.dart';

import 'db_provider.dart';

class NewOrderRepository {


  Future<Id> createOrder({
    required ModelClientDb client,
    OutletsResponse? outlet,
  }) async {
    final isar = await DbProvider.instance();

    // Определяем адрес доставки
    String deliveryAddress = 'Адрес не указан';
    String? deliveryComment;

    if (outlet != null) {
      if (outlet.comment == true) {
        deliveryComment = outlet.comment;
        deliveryAddress = outlet.address ?? 'Адрес не указан';
      } else {
        deliveryAddress = outlet.address ?? 'Адрес не указан';
      }
    }

    // Создаём заказ
    final order = ModelDocumentDb()
      ..clientName = client.name ?? 'Без имени'
      ..clientUid = client.uid ?? ''
      ..code = ''
      ..comment = ''
      ..dateProcessed = DateTime.now()
      ..dateValid = DateTime.now()
      ..deliveryAddress = deliveryAddress
      ..state = 0
      ..stockName = ''
      ..stockUid = ''
      ..sum = 0.0
    //  ..tranmit = false
      ..uid = '';


    // Сохраняем в базу
    final orderId = await isar.writeTxn(() async {
      return await isar.modelDocumentDbs.put(order);
    });
    return orderId;
  }



  Future<int> addOutland({
    OutletsResponse? outlet,
    required int orderId,

  }) async {
    final isar = await DbProvider.instance();
    final deliveryAddress = outlet?.comment == true
        ? outlet!.comment
        : outlet?.address == true
        ? outlet!.address
        : 'Адрес не указан';

    // Создаём заказ
    await isar.writeTxn(() async {
      // Получаем существующий заказ
      final order = await isar.modelDocumentDbs.get(orderId);

      if (order != null) {
        // Меняем только нужный параметр
        order.deliveryAddress = deliveryAddress ?? '';

        // Сохраняем обратно
        await isar.modelDocumentDbs.put(order);
      }
    });
    return orderId;
  }



  Future<void> updateUuidOrder({
    required String uuid,
    required int orderId,
    required String code ,
    required int state ,

  }) async {
    final isar = await DbProvider.instance();

    // Создаём заказ
    await isar.writeTxn(() async {
      // Получаем существующий заказ
      final order = await isar.modelDocumentDbs.get(orderId);

      if (order != null) {
        // Меняем только нужный параметр
        order.uid = uuid;
        order.code = code;
        order.state = state;

        // Сохраняем обратно
        await isar.modelDocumentDbs.put(order);
      }
    });
  }



  /// Добавление товара в заказ
  Future<void> addLineToOrder({
    required Id orderId,
    required ModelAssortimentDB item,
    required double quantity,
    Prices? priceSelected,
  }) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      // Получаем заказ
      final order = await isar.modelDocumentDbs.get(orderId);
      if (order == null) {
        throw Exception('Заказ с ID $orderId не найден');
      }

      // Загружаем существующие строки
      await order.lines.load();

      // Определяем цену
      final price = priceSelected?.price ?? item.price ?? 0.0;

      // Считаем сумму
      final sum = price * quantity;

      // Определяем номер строки
      final lineNumber = order.lines.length + 1;

      // Создаём строку заказа
      final orderLine = ModelLinesDb()
      //  ..orderId = orderId ?? 0
        ..assortimentBarcode = item.barCode ?? ''
        ..assortimentCode = item.code ?? 'Без названия'
        ..assortimentName = item.name ?? ''
        ..assortimentUid = item.uid ?? ''
        ..lineNumber = lineNumber
        ..count = quantity
        ..unitName = item.unitName ?? 'шт'
        ..price = price
        ..sum = sum
        ..uid = '00000000-0000-0000-0000-000000000000'
        ..unitUid = ''
        ..lineUuid = item.pricelineUid ?? '00000000-0000-0000-0000-000000000000'
        ..processedCount = quantity
        ..unitName = item.unitName ?? '';
      // Сохраняем строку


      print('что-то тут не так');
      await isar.modelLinesDbs.put(orderLine);
      // Связываем со заказом
      order.lines.add(orderLine);
      await order.lines.save();
      // Обновляем общую сумму заказа
      order.sum += sum;
    //  order.tranmit = false;
      // Сохраняем заказ
      await isar.modelDocumentDbs.put(order);
    });
  }

  /// Получение заказа по ID
  Future<ModelDocumentDb?> getOrder(Id orderId) async {
    final isar = await DbProvider.instance();
    final order = await isar.modelDocumentDbs.get(orderId);

    if (order != null) {
      await order.lines.load();
    }

    return order;
  }

  /// Получение всех заказов
  Future<List<ModelDocumentDb>> getAllOrders() async {
    final isar = await DbProvider.instance();
    final orders = await isar.modelDocumentDbs.where().findAll();

    // Загружаем строки для каждого заказа
    for (var order in orders) {
      await order.lines.load();
    }

    return orders;
  }

  /// Получение строк заказа
  Future<List<ModelLinesDb>> getOrderLines(int orderId) async {
    final isar = await DbProvider.instance();
    final order = await isar.modelDocumentDbs.get(orderId);
    return await order?.lines.toList() ?? [];
  }

  /// Удаление строки из заказа
  Future<void> removeLineFromOrder({
    required Id orderId,
    required Id lineId,
  }) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      // Получаем заказ
      final order = await isar.modelDocumentDbs.get(orderId);
      if (order == null) return;

      // Получаем строку
      final line = await isar.modelLinesDbs.get(lineId);
      if (line == null) return;

      // Загружаем связи
      await order.lines.load();

      // Вычитаем сумму строки из общей суммы
      order.sum -= line.sum;

      // Удаляем строку из связи
      order.lines.remove(line);
      await order.lines.save();

      // Удаляем строку из базы
      await isar.modelLinesDbs.delete(lineId);

      // Сохраняем заказ
    //  order.tranmit = false;
      await isar.modelDocumentDbs.put(order);

      print('✅ Товар удалён из заказа');
      print('   Новая сумма: ${order.sum.toStringAsFixed(2)}');
    });
  }

  /// Обновление количества товара в строке
  Future<void> updateLineQuantity({
    required Id orderId,
    required Id lineId,
    required double newQuantity,
  }) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      final order = await isar.modelDocumentDbs.get(orderId);
      final line = await isar.modelLinesDbs.get(lineId);

      if (order == null || line == null) return;

      // Вычитаем старую сумму
      order.sum -= line.sum;

      // Обновляем количество и сумму
      line.count = newQuantity;
      line.sum = line.price * newQuantity;
      line.processedCount = newQuantity;

      // Добавляем новую сумму
      order.sum += line.sum;

      // Сохраняем
      await isar.modelLinesDbs.put(line);
    //  order.tranmit = false;
      await isar.modelDocumentDbs.put(order);

      print('✅ Количество обновлено:');
      print('   Новое количество: $newQuantity');
      print('   Новая сумма строки: ${line.sum.toStringAsFixed(2)}');
      print('   Общая сумма заказа: ${order.sum.toStringAsFixed(2)}');
    });
  }



  /// Пометить заказ как отправленный
  Future<void> markOrderAsTransmitted(Id orderId, String uuid) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      final order = await isar.modelDocumentDbs.get(orderId);
      if (order == null) return;

      order.uid = uuid;
      order.dateProcessed = DateTime.now();

      await isar.modelDocumentDbs.put(order);
      print('✅ Заказ отмечен как отправленный');
    });
  }

  /// Получить неотправленные заказы
  Future<List<ModelDocumentDb>> getUntransmittedOrders() async {
    final isar = await DbProvider.instance();
    final orders = await isar.modelDocumentDbs
        .filter()
        .uidIsEmpty()
        .findAll();

    for (var order in orders) {
      await order.lines.load();
    }

    return orders;
  }

  Future<int> createDocumentCopy(ModelDocumentDb original) async {
    final isar = await DbProvider.instance();
    final db = ModelDocumentDb()
      ..clientName = original.clientName ?? ''
      ..clientUid = original.clientUid ?? ''
      ..code = ''
      ..comment = original.comment ?? ''
      ..dateProcessed = DateTime.now()
      ..dateValid = DateTime.now()
      ..deliveryAddress = original.deliveryAddress ?? ''
      ..state = 0
      ..stockName = original.stockName
      ..stockUid = original.stockUid
      ..sum = original.sum
      ..uid = '';
    final linesDB = original.lines.map((lines) {
      return ModelLinesDb()
        ..assortimentBarcode = lines.assortimentBarcode ?? ''
        ..assortimentCode = lines.assortimentCode ?? ''
        ..assortimentName = lines.assortimentName
        ..assortimentUid = lines.assortimentUid
        ..count = lines.count
        ..lineNumber = lines.lineNumber
        ..price = lines.price
        ..processedCount = lines.processedCount
        ..sum = lines.sum
        ..uid = lines.uid
        ..lineUuid = ''
        ..unitName = lines.unitName
        ..unitUid = lines.unitUid;
    }).toList();

    await isar.writeTxn(() async {
      await isar.modelDocumentDbs.put(db); // сначала документ
      await isar.modelLinesDbs.putAll(linesDB); // потом строки

      // связываем через IsarLinks
      db.lines.addAll(linesDB);
      await db.lines.save();
    });
    return db.id;
  }


  Future<bool> deleteOrderWithLinesByUuid(int uuid) async {
    try {
      final isar = await DbProvider.instance();
      bool deleted = false;

      await isar.writeTxn(() async {
        final doc = await isar.modelDocumentDbs
            .filter()
            .idEqualTo(uuid)
            .findFirst();

        if (doc == null) {
          print('⚠️ Документ с UUID $uuid не найден');
          return;
        }

        if (doc.state != 0 && doc.state != 1) {
          throw Exception('Можно удалять только документы со статусом 0 или 1');
        }

        // Загрузить и удалить связанные строки
        await doc.lines.load();
        final lineIds = doc.lines.map((line) => line.id).toList();
        final deletedLinesCount = await isar.modelLinesDbs.deleteAll(lineIds);

        print('🗑️ Удалено строк: $deletedLinesCount');

        // Удалить документ
        deleted = await isar.modelDocumentDbs.delete(doc.id);
      });

      return deleted;

    } catch (e) {
      print('❌ Ошибка при удалении документа: $e');
      rethrow;
    }
  }

  Future<bool> addCommentToOrder(int id, String comment) async {
    final isar = await DbProvider.instance();
    try{
      await isar.writeTxn(() async {
        final order = await isar.modelDocumentDbs.get(id);
        if (order == null) return false;
        order.comment = comment;
        await isar.modelDocumentDbs.put(order);
        print('✅ Заказ обновлен');
        return true;
      });
    }catch(e){
      return false;
    }
    return false;
  }

  Future<String> getCommentFromOrder(int id) async{
    final isar = await DbProvider.instance();
    final order = await isar.modelDocumentDbs.get(id);
    return await order!.comment;
  }

}
