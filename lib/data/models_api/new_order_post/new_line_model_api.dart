import 'package:json_annotation/json_annotation.dart';

part 'new_line_model_api.g.dart';

@JsonSerializable()
class NewLineModelApi{

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


  NewLineModelApi({
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

  factory NewLineModelApi.fromJson(Map<String, dynamic> json) =>
      _$NewLineModelApiFromJson(json);

  Map<String, dynamic> toJson() => _$NewLineModelApiToJson(this);
}
