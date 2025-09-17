// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_lines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelLines _$ModelLinesFromJson(Map<String, dynamic> json) => ModelLines(
      assortimentBarcode: json['AssortimentBarcode'] as String,
      assortimentCode: json['AssortimentCode'] as String,
      assortimentName: json['AssortimentName'] as String,
      assortimentUid: json['AssortimentUid'] as String,
      count: (json['Count'] as num).toDouble(),
      lineNumber: (json['LineNumber'] as num).toInt(),
      price: (json['Price'] as num).toDouble(),
      processedCount: (json['ProcessedCount'] as num).toDouble(),
      sum: (json['Sum'] as num).toDouble(),
      uid: json['Uid'] as String,
      unitName: json['UnitName'] as String,
      unitUid: json['UnitUid'] as String,
    );

Map<String, dynamic> _$ModelLinesToJson(ModelLines instance) =>
    <String, dynamic>{
      'AssortimentBarcode': instance.assortimentBarcode,
      'AssortimentCode': instance.assortimentCode,
      'AssortimentName': instance.assortimentName,
      'AssortimentUid': instance.assortimentUid,
      'Count': instance.count,
      'LineNumber': instance.lineNumber,
      'Price': instance.price,
      'ProcessedCount': instance.processedCount,
      'Sum': instance.sum,
      'Uid': instance.uid,
      'UnitName': instance.unitName,
      'UnitUid': instance.unitUid,
    };
