// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_get_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelGetOrders _$ModelGetOrdersFromJson(Map<String, dynamic> json) =>
    ModelGetOrders(
      errorCode: (json['ErrorCode'] as num).toInt(),
      errorMessage: json['ErrorMessage'] as String?,
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      documents: (json['Documents'] as List<dynamic>?)
          ?.map((e) => ModelDocuments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelGetOrdersToJson(ModelGetOrders instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'Documents': instance.documents,
    };
