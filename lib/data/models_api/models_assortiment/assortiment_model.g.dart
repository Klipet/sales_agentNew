// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assortiment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssortimentModel _$AssortimentModelFromJson(Map<String, dynamic> json) =>
    AssortimentModel(
      barCode: json['BarCode'] as String? ?? '',
      code: json['Code'] as String? ?? '',
      description: json['Description'] as String? ?? '',
      fullName: json['FullName'] as String? ?? '',
      isFolder: json['IsFolder'] as bool? ?? false,
      name: json['Name'] as String? ?? '',
      parentUid: json['ParentUid'] as String? ?? '',
      uid: json['Uid'] as String? ?? '',
      countInPackage: (json['CountInPackage'] as num?)?.toDouble() ?? 0,
      marking: json['Marking'] as String? ?? '',
      nonWhole: json['NonWhole'] as bool? ?? false,
      price: (json['Price'] as num?)?.toDouble() ?? 0.0,
      pricelineUid: json['PricelineUid'] as String? ?? '',
      remain: (json['Remain'] as num?)?.toDouble() ?? 0.0,
      unitInPackage: json['UnitInPackage'] as String? ?? '',
      unitName: json['UnitName'] as String? ?? '',
    );

Map<String, dynamic> _$AssortimentModelToJson(AssortimentModel instance) =>
    <String, dynamic>{
      'BarCode': instance.barCode,
      'Code': instance.code,
      'Description': instance.description,
      'FullName': instance.fullName,
      'IsFolder': instance.isFolder,
      'Name': instance.name,
      'ParentUid': instance.parentUid,
      'Uid': instance.uid,
      'CountInPackage': instance.countInPackage,
      'Marking': instance.marking,
      'NonWhole': instance.nonWhole,
      'Price': instance.price,
      'PricelineUid': instance.pricelineUid,
      'Remain': instance.remain,
      'UnitInPackage': instance.unitInPackage,
      'UnitName': instance.unitName,
    };
