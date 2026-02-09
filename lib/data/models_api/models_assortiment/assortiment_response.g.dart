// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assortiment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssortimentResponse _$AssortimentResponseFromJson(Map<String, dynamic> json) =>
    AssortimentResponse(
      errorCode: (json['ErrorCode'] as num).toInt(),
      errorMessage: json['ErrorMessage'] as String? ?? '',
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      assortiment: (json['Assortiment'] as List<dynamic>?)
              ?.map((e) => AssortimentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AssortimentResponseToJson(
        AssortimentResponse instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'Assortiment': instance.assortiment,
    };
