import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_new_order/new_model_document_id.dart';
import 'package:uuid/uuid.dart';

import '../models_api/models_client_detail/detail_outlands.dart';
import '../models_api/models_client_prices/prices.dart';
import '../models_db/model_db_assortiment/model_assortiment_db.dart';
import '../models_db/model_db_clients/model_client_db.dart';
import '../models_db/model_db_new_order/new_order_line_model_db.dart';
import '../models_db/model_db_new_order/new_order_model_db.dart';
import 'db_provider.dart';

class NewOrderRepository {
  final _uuid = Uuid();

  Future<void> addOrderId(int orderId) async {
    final isar = await DbProvider.instance();
    final addOrderId = NewModelDocumentId()
      ..dicumentId = orderId;


    // Сохраняем в базу
     await isar.writeTxn(() async {
      return await isar.newModelDocumentIds.put(addOrderId);
    });
  }

  Future<List<NewModelDocumentId>> getOrderId() async {
    final isar = await DbProvider.instance();
    final orders = await isar.newModelDocumentIds.where().findAll();


    return orders;
  }
  Future<void> deleteOrderId() async {
    final isar = await DbProvider.instance();
    await isar.newModelDocumentIds.clear();
  }

  Future<Id> createOrder({
    required ModelClientDb client,
    DetailOutlands? outlet,
  }) async {
    final isar = await DbProvider.instance();

    // Определяем адрес доставки
    String deliveryAddress = 'Адрес не указан';
    String? deliveryComment;

    if (outlet != null) {
      if (outlet.comment?.isNotEmpty == true) {
        deliveryComment = outlet.comment;
        deliveryAddress = outlet.address ?? 'Адрес не указан';
      } else {
        deliveryAddress = outlet.address ?? 'Адрес не указан';
      }
    }

    // Создаём заказ
    final order = NewOrderModelDb()
      ..clientName = client.name ?? 'Без имени'
      ..clientUid = client.uid ?? ''
      ..code = 'ORD-${DateTime.now().millisecondsSinceEpoch}'
      ..comment = ''
      ..dateProcessed = DateTime.now().toString()
      ..dateValid = DateTime.now().toString()
      ..deliveryAddress = deliveryAddress
      ..state = 0
      ..stockName = ''
      ..stockUid = ''
      ..sum = 0.0
      ..tranmit = false
      ..uid = _uuid.v4();


    // Сохраняем в базу
    final orderId = await isar.writeTxn(() async {
      return await isar.newOrderModelDbs.put(order);
    });

    print('✅ Заказ создан: ${order.code}, ID: $orderId');
    print('   Клиент: ${order.clientName}');
    print('   Адрес: ${order.deliveryAddress}');

    return orderId;
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
      final order = await isar.newOrderModelDbs.get(orderId);
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
      final orderLine = NewOrderLineModelDb()
        ..orderId = orderId ?? 0
        ..assortimentBarcode = item.barCode ?? ''
        ..assortimentCode = item.code ?? 'Без названия'
        ..assortimentName = item.name ?? ''
        ..assortimentUid = item.uid ?? ''
        ..lineNumber = lineNumber
        ..count = quantity
        ..unitName = item.unitName ?? 'шт'
        ..price = price
        ..sum = sum
        ..uid = ''
        ..unitUid = ''
        ..processedCount = quantity
        ..unitName = item.unitName ?? '';
      // Сохраняем строку
      await isar.newOrderLineModelDbs.put(orderLine);
      // Связываем со заказом
      order.lines.add(orderLine);
      await order.lines.save();
      // Обновляем общую сумму заказа
      order.sum += sum;
      order.tranmit = false;
      // Сохраняем заказ
      await isar.newOrderModelDbs.put(order);

      print('✅  Товар добавлен в заказ:');
      print('   Товар: ${item.name}');
      print('  Количество: $quantity ${item.unitName}');
      print(' Сумма строки: ${sum.toStringAsFixed(2)}');
      print('Общая сумма заказа: ${order.sum.toStringAsFixed(2)}');
    });
  }

  /// Получение заказа по ID
  Future<NewOrderModelDb?> getOrder(Id orderId) async {
    final isar = await DbProvider.instance();
    final order = await isar.newOrderModelDbs.get(orderId);

    if (order != null) {
      await order.lines.load();
    }

    return order;
  }

  /// Получение всех заказов
  Future<List<NewOrderModelDb>> getAllOrders() async {
    final isar = await DbProvider.instance();
    final orders = await isar.newOrderModelDbs.where().findAll();

    // Загружаем строки для каждого заказа
    for (var order in orders) {
      await order.lines.load();
    }

    return orders;
  }

  /// Получение строк заказа
  Future<List<NewOrderLineModelDb>> getOrderLines(Id orderId) async {
    final isar = await DbProvider.instance();
    return await isar.newOrderLineModelDbs
        .filter()
        .orderIdEqualTo(orderId)
        .findAll();
  }

  /// Удаление строки из заказа
  Future<void> removeLineFromOrder({
    required Id orderId,
    required Id lineId,
  }) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      // Получаем заказ
      final order = await isar.newOrderModelDbs.get(orderId);
      if (order == null) return;

      // Получаем строку
      final line = await isar.newOrderLineModelDbs.get(lineId);
      if (line == null) return;

      // Загружаем связи
      await order.lines.load();

      // Вычитаем сумму строки из общей суммы
      order.sum -= line.sum;

      // Удаляем строку из связи
      order.lines.remove(line);
      await order.lines.save();

      // Удаляем строку из базы
      await isar.newOrderLineModelDbs.delete(lineId);

      // Сохраняем заказ
      order.tranmit = false;
      await isar.newOrderModelDbs.put(order);

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
      final order = await isar.newOrderModelDbs.get(orderId);
      final line = await isar.newOrderLineModelDbs.get(lineId);

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
      await isar.newOrderLineModelDbs.put(line);
      order.tranmit = false;
      await isar.newOrderModelDbs.put(order);

      print('✅ Количество обновлено:');
      print('   Новое количество: $newQuantity');
      print('   Новая сумма строки: ${line.sum.toStringAsFixed(2)}');
      print('   Общая сумма заказа: ${order.sum.toStringAsFixed(2)}');
    });
  }

  /// Удаление заказа полностью
  Future<void> deleteOrder(Id orderId) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      // Получаем заказ
      final order = await isar.newOrderModelDbs.get(orderId);
      if (order == null) return;

      // Загружаем строки
      await order.lines.load();

      // Удаляем все строки
      for (var line in order.lines) {
        await isar.newOrderLineModelDbs.delete(line.id);
      }

      // Удаляем сам заказ
      await isar.newOrderModelDbs.delete(orderId);

      print('✅ Заказ удалён: ID $orderId');
    });
  }

  /// Пометить заказ как отправленный
  Future<void> markOrderAsTransmitted(Id orderId) async {
    final isar = await DbProvider.instance();

    await isar.writeTxn(() async {
      final order = await isar.newOrderModelDbs.get(orderId);
      if (order == null) return;

      order.tranmit = true;
      order.state = 1;
      order.dateProcessed = DateTime.now().toString();

      await isar.newOrderModelDbs.put(order);
      print('✅ Заказ отмечен как отправленный');
    });
  }

  /// Получить неотправленные заказы
  Future<List<NewOrderModelDb>> getUntransmittedOrders() async {
    final isar = await DbProvider.instance();
    final orders = await isar.newOrderModelDbs
        .filter()
        .tranmitEqualTo(false)
        .findAll();

    for (var order in orders) {
      await order.lines.load();
    }

    return orders;
  }
}
