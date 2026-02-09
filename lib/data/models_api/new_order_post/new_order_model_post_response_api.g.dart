// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_model_post_response_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderModelPostResponseApi _$NewOrderModelPostResponseApiFromJson(
        Map<String, dynamic> json) =>
    NewOrderModelPostResponseApi(
      errorCode: (json['ErrorCode'] as num?)?.toInt() ?? 0,
      errorMessage: json['ErrorMessage'] as String? ?? '',
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      code: json['Code'] as String? ?? '',
      state: (json['State'] as num?)?.toInt() ?? 0,
      uuid: json['Uid'] as String? ?? '',
    );

Map<String, dynamic> _$NewOrderModelPostResponseApiToJson(
        NewOrderModelPostResponseApi instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'Code': instance.code,
      'State': instance.state,
      'Uid': instance.uuid,
    };
