import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_order_line_model_db.g.dart';
@collection
@JsonSerializable()
class NewOrderLineModelDb{
  Id id = Isar.autoIncrement;

  @JsonKey(name: 'AssortimentBarcode', defaultValue: '')
   final String assortimentBarcode;
  @JsonKey(name: 'AssortimentCode', defaultValue: '')
   final String assortimentCode;
  @JsonKey(name: 'AssortimentName', defaultValue: '')
   final String assortimentName;
  @JsonKey(name: 'AssortimentUid', defaultValue: '')
   final String assortimentUid;
  @JsonKey(name: 'Count', defaultValue: 0.0)
   final double count;
  @JsonKey(name: 'LineNumber', defaultValue: 0)
   final int lineNumber;
  @JsonKey(name: 'Price', defaultValue: 0.0)
   final double price;
  @JsonKey(name: 'ProcessedCount', defaultValue: 0.0)
   final double processedCount;
  @JsonKey(name: 'Sum', defaultValue: 0.0)
   final double sum;
  @JsonKey(name: 'Uid', defaultValue: '')
   final String uid;
  @JsonKey(name: 'UnitName', defaultValue: '')
   final String unitName;
  @JsonKey(name: 'UnitUid', defaultValue: '')
   final String unitUid;


  NewOrderLineModelDb({
    required this.assortimentBarcode,
    required this.assortimentCode,
    required this.assortimentName,
    required this.assortimentUid,
    required this.count,
    required this.lineNumber,
    required this.price,
    required this.processedCount,
    required this.sum,
    required this.uid,
    required this.unitName,
    required this.unitUid,
  });

  factory NewOrderLineModelDb.fromJson(Map<String, dynamic> json) =>
      _$NewOrderLineModelDbFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderLineModelDbToJson(this);
}

