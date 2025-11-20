import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'new_order_line_model_db.dart';

part 'new_order_model_db.g.dart';

@collection

class NewOrderModelDb{
  Id id = Isar.autoIncrement; // локальный ID для базы
  late String clientName;
  late String clientUid;
  late String code;
  late String comment;
  late String dateProcessed;
  late String dateValid;
  late String deliveryAddress;
  late int state;
  late String stockName;
  late String stockUid;
  late double sum;
  late String uid;
  /// 👇 Это реальное поле для Isar (связи)
  final lines = IsarLinks<NewOrderLineModelDb>();
  bool tranmit = false;
}
