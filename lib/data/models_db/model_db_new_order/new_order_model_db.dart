import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'new_order_line_model_db.dart';

part 'new_order_model_db.g.dart';

@collection
@JsonSerializable()
class NewOrderModelDb{
  Id id = Isar.autoIncrement; // локальный ID для базы

  @JsonKey(name: 'ClientName', defaultValue: '')
  final String clientName;
  @JsonKey(name: 'ClientUid', defaultValue: '')
  final String clientUid;
  @JsonKey(name: 'Code', defaultValue: '')
  final String code;
  @JsonKey(name: 'Comment', defaultValue: '')
  final String comment;
  @JsonKey(name: 'DateProcessed', defaultValue: '')
  final String dateProcessed;
  @JsonKey(name: 'DateValid', defaultValue: '')
  final String dateValid;
  @JsonKey(name: 'DeliveryAddress', defaultValue: '')
  final String deliveryAddress;
  @JsonKey(name: 'State', defaultValue: 0)
  final int state;
  @JsonKey(name: 'StockName', defaultValue: '')
  final String stockName;
  @JsonKey(name: 'StockUid', defaultValue: '')
  final String stockUid;
  @JsonKey(name: 'Sum', defaultValue: 0.0)
  final double sum;
  @JsonKey(name: 'Uid', defaultValue: '')
  final String uid;

  /// 👇 Это временное поле для JSON-сериализации (список)
  @ignore
  @JsonKey(name: 'Lines', defaultValue: [])
  List<NewOrderLineModelDb> linesJson = [];

  /// 👇 Это реальное поле для Isar (связи)
  final lines = IsarLinks<NewOrderLineModelDb>();

  NewOrderModelDb({
    required this.clientName,
    required this.clientUid,
    required this.code,
    required this.comment,
    required this.dateProcessed,
    required this.dateValid,
    required this.deliveryAddress,
    required this.state,
    required this.stockName,
    required this.stockUid,
    required this.sum,
    required this.uid,
  });

  factory NewOrderModelDb.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModelDbFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderModelDbToJson(this);
}
