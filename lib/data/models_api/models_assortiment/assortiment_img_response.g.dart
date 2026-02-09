// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assortiment_img_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssortimentImgResponse _$AssortimentImgResponseFromJson(
        Map<String, dynamic> json) =>
    AssortimentImgResponse(
      errorCode: (json['ErrorCode'] as num?)?.toInt() ?? 0,
      errorMessage: json['ErrorMessage'] as String? ?? '',
      images: (json['Images'] as List<dynamic>?)
              ?.map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AssortimentImgResponseToJson(
        AssortimentImgResponse instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Images': instance.images,
    };
