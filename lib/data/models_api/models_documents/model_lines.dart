import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model_lines.g.dart';

@JsonSerializable()
class ModelLines {
  @JsonKey(name: 'AssortimentBarcode')
  final String assortimentBarcode;

  @JsonKey(name: 'AssortimentCode')
  final String assortimentCode;

  @JsonKey(name: 'AssortimentName')
  final String assortimentName;

  @JsonKey(name: 'AssortimentUid')
  final String assortimentUid;

  @JsonKey(name: 'Count')
  final double count;

  @JsonKey(name: 'LineNumber')
  final int lineNumber;

  @JsonKey(name: 'Price')
  final double price;

  @JsonKey(name: 'ProcessedCount')
  final double processedCount;

  @JsonKey(name: 'Sum')
  final double sum;

  @JsonKey(name: 'Uid')
  final String uid;

  @JsonKey(name: 'UnitName')
  final String unitName;

  @JsonKey(name: 'UnitUid')
  final String unitUid;

  ModelLines({
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

  factory ModelLines.fromJson(Map<String, dynamic> json) => _$ModelLinesFromJson(json);

  Map<String, dynamic> toJson() => _$ModelLinesToJson(this);
}