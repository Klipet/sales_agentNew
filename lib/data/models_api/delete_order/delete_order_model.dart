import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/models_documents/model_documents.dart';
import 'package:sales_agent/logic/blocs/new_order_bloc/new_order_event.dart';

import '../models_documents/token.dart';
part 'delete_order_model.g.dart';

@JsonSerializable()
class DeleteOrderModel{
  @JsonKey(name: 'ErrorCode', defaultValue: 0)
  final int errorCode;
  @JsonKey(name: 'ErrorMessage', defaultValue: '')
  final String? errorMessage;
  @JsonKey(name: 'Token')
  final Token? token;
  @JsonKey(name: 'Documents')
  final ModelDocuments? documents;
  DeleteOrderModel({
    required this.errorCode,
    this.errorMessage,
    this.token,
    this.documents,
  });
  factory DeleteOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteOrderModelToJson(this);


}