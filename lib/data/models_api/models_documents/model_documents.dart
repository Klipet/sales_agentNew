import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/models_documents/model_lines.dart';
part 'model_documents.g.dart';


@JsonSerializable()
class ModelDocuments {
  @JsonKey(name: 'ClientName')
  final String? clientName;

  @JsonKey(name: 'ClientUid')
  final String clientUid;

  @JsonKey(name: 'Code')
  final String code;

  @JsonKey(name: 'Comment')
  final String? comment;

  @JsonKey(name: 'DateProcessed')
  final String? dateProcessed; // Можно преобразовать в DateTime при необходимости

  @JsonKey(name: 'DateValid')
  final String dateValid; // Можно преобразовать в DateTime при необходимости

  @JsonKey(name: 'DeliveryAddress')
  final String? deliveryAddress;

  @JsonKey(name: 'Lines')
  final List<ModelLines> lines;

  @JsonKey(name: 'State')
  final int state;

  @JsonKey(name: 'StockName')
  final String? stockName;

  @JsonKey(name: 'StockUid')
  final String stockUid;

  @JsonKey(name: 'Sum')
  final double sum;

  @JsonKey(name: 'Uid')
  final String uid;

  ModelDocuments({
    this.clientName,
    required this.clientUid,
    required this.code,
    this.comment,
    this.dateProcessed,
    required this.dateValid,
    this.deliveryAddress,
    required this.lines,
    required this.state,
    this.stockName,
    required this.stockUid,
    required this.sum,
    required this.uid,
  });

  factory ModelDocuments.fromJson(Map<String, dynamic> json) =>
      _$ModelDocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelDocumentsToJson(this);
}