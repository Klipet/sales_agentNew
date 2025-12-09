// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assortiment_img_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssotrimentImageBody _$AssotrimentImageBodyFromJson(
        Map<String, dynamic> json) =>
    AssotrimentImageBody(
      assortimetn: (json['Assortiment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      token: json['TokenUid'] as String? ?? '',
    );

Map<String, dynamic> _$AssotrimentImageBodyToJson(
        AssotrimentImageBody instance) =>
    <String, dynamic>{
      'Assortiment': instance.assortimetn,
      'TokenUid': instance.token,
    };
