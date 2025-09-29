import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/model_token.dart';
import 'package:sales_agent/data/models_api/models_documents/token.dart';

import 'model_documents.dart';

part 'model_get_orders.g.dart';

@JsonSerializable()
class ModelGetOrders{
  @JsonKey(name: 'ErrorCode')
  final int errorCode;

  @JsonKey(name: 'ErrorMessage')
  final String? errorMessage;

  @JsonKey(name: 'Token')
  final Token? token;

  @JsonKey(name: 'Documents')
  final List<ModelDocuments>? documents;

  ModelGetOrders({
    required this.errorCode,
    this.errorMessage,
    this.token,
    this.documents,
  });

  factory ModelGetOrders.fromJson(Map<String, dynamic> json) =>
      _$ModelGetOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ModelGetOrdersToJson(this);
}