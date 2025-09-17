// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelDocuments _$ModelDocumentsFromJson(Map<String, dynamic> json) =>
    ModelDocuments(
      clientName: json['ClientName'] as String?,
      clientUid: json['ClientUid'] as String,
      code: json['Code'] as String,
      comment: json['Comment'] as String?,
      dateProcessed: json['DateProcessed'] as String?,
      dateValid: json['DateValid'] as String,
      deliveryAddress: json['DeliveryAddress'] as String?,
      lines: (json['Lines'] as List<dynamic>)
          .map((e) => ModelLines.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['State'] as num).toInt(),
      stockName: json['StockName'] as String?,
      stockUid: json['StockUid'] as String,
      sum: (json['Sum'] as num).toDouble(),
      uid: json['Uid'] as String,
    );

Map<String, dynamic> _$ModelDocumentsToJson(ModelDocuments instance) =>
    <String, dynamic>{
      'ClientName': instance.clientName,
      'ClientUid': instance.clientUid,
      'Code': instance.code,
      'Comment': instance.comment,
      'DateProcessed': instance.dateProcessed,
      'DateValid': instance.dateValid,
      'DeliveryAddress': instance.deliveryAddress,
      'Lines': instance.lines,
      'State': instance.state,
      'StockName': instance.stockName,
      'StockUid': instance.stockUid,
      'Sum': instance.sum,
      'Uid': instance.uid,
    };
