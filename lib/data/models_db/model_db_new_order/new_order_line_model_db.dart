import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_order_line_model_db.g.dart';
@collection
class NewOrderLineModelDb{
  Id id = Isar.autoIncrement;
  @Index()
  late int orderId;
  late String assortimentBarcode;
  late String assortimentCode;
  late String assortimentName;
  late String assortimentUid;
  late double count;
  late int lineNumber;
  late double price;
  late double processedCount;
  late double sum;
  late String uid;
  late String unitName;
  late String unitUid;
}

