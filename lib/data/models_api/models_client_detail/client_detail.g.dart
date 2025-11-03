// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDetail _$ClientDetailFromJson(Map<String, dynamic> json) => ClientDetail(
      balance: (json['Balance'] as num?)?.toDouble() ?? 0,
      code: json['Code'] as String? ?? '',
      idnp: json['IDNP'] as String? ?? '----',
      image: json['Image'] as String? ?? '',
      name: json['Name'] as String? ?? '',
      outlets: (json['Outlets'] as List<dynamic>?)
              ?.map((e) => DetailOutlands.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pricelistUid: json['PricelistUid'] as String? ?? '',
      tvaCode: json['TVACode'] as String? ?? '',
      uid: json['Uid'] as String? ?? '',
    );

Map<String, dynamic> _$ClientDetailToJson(ClientDetail instance) =>
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
