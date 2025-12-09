// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageItem _$ImageItemFromJson(Map<String, dynamic> json) => ImageItem(
      image1: (json['Image1'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      image2: (json['Image2'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      image3: (json['Image3'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      image4: (json['Image4'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      uid: json['Uid'] as String? ?? '',
    );

Map<String, dynamic> _$ImageItemToJson(ImageItem instance) => <String, dynamic>{
      'Image1': instance.image1,
      'Image2': instance.image2,
      'Image3': instance.image3,
      'Image4': instance.image4,
      'Uid': instance.uid,
    };
