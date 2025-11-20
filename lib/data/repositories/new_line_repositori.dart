import 'package:isar/isar.dart';

import '../models_db/model_db_new_order/new_order_line_model_db.dart';
import 'db_provider.dart';

class NewLineRepository{
  /// Получение строк заказа
  Future<List<NewOrderLineModelDb>> getOrderLines(Id orderId) async {
    final isar = await DbProvider.instance();
    return await isar.newOrderLineModelDbs
        .filter()
        .orderIdEqualTo(orderId)
        .findAll();
  }

}