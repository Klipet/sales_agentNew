// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailClientResponse _$DetailClientResponseFromJson(
        Map<String, dynamic> json) =>
    DetailClientResponse(
      errorCode: (json['ErrorCode'] as num).toInt(),
      errorMessage: json['ErrorMessage'] as String?,
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      contragents: json['Contragent'] == null
          ? null
          : ClientDetail.fromJson(json['Contragent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailClientResponseToJson(
        DetailClientResponse instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'Contragent': instance.contragents,
    };
