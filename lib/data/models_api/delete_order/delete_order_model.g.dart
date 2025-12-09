// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteOrderModel _$DeleteOrderModelFromJson(Map<String, dynamic> json) =>
    DeleteOrderModel(
      errorCode: (json['ErrorCode'] as num?)?.toInt() ?? 0,
      errorMessage: json['ErrorMessage'] as String? ?? '',
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      documents: json['Documents'] == null
          ? null
          : ModelDocuments.fromJson(json['Documents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteOrderModelToJson(DeleteOrderModel instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'Documents': instance.documents,
    };
