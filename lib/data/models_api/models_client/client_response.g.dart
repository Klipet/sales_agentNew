// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) =>
    ClientResponse(
      errorCode: (json['ErrorCode'] as num).toInt(),
      errorMessage: json['ErrorMessage'] as String?,
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      contragents: (json['Contragents'] as List<dynamic>?)
          ?.map((e) => ContragentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClientResponseToJson(ClientResponse instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'Contragents': instance.contragents,
    };
