// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contragent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContragentResponse _$ContragentResponseFromJson(Map<String, dynamic> json) =>
    ContragentResponse(
      balance: (json['Balance'] as num?)?.toDouble(),
      code: json['Code'] as String?,
      idnp: json['IDNP'] as String?,
      image: json['Image'] as String?,
      name: json['Name'] as String?,
      outlets: (json['Outlets'] as List<dynamic>?)
          ?.map((e) => OutletsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricelistUid: json['PricelistUid'] as String?,
      tvaCode: json['TVACode'] as String?,
      uid: json['Uid'] as String?,
    );

Map<String, dynamic> _$ContragentResponseToJson(ContragentResponse instance) =>
    <String, dynamic>{
      'Balance': instance.balance,
      'Code': instance.code,
      'IDNP': instance.idnp,
      'Image': instance.image,
      'Name': instance.name,
      'Outlets': instance.outlets,
      'PricelistUid': instance.pricelistUid,
      'TVACode': instance.tvaCode,
      'Uid': instance.uid,
    };
