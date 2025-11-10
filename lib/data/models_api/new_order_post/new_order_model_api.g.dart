// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_model_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderModelApi _$NewOrderModelApiFromJson(Map<String, dynamic> json) =>
    NewOrderModelApi(
      clientName: json['ClientName'] as String? ?? '',
      clientUid: json['ClientUid'] as String? ?? '',
      code: json['Code'] as String? ?? '',
      comment: json['Comment'] as String? ?? '',
      dateProcessed: json['DateProcessed'] as String? ?? '',
      dateValid: json['DateValid'] as String? ?? '',
      deliveryAddress: json['DeliveryAddress'] as String? ?? '',
      state: (json['State'] as num?)?.toInt() ?? 0,
      stockName: json['StockName'] as String? ?? '',
      stockUid: json['StockUid'] as String? ?? '',
      sum: (json['Sum'] as num?)?.toDouble() ?? 0.0,
      uid: json['Uid'] as String? ?? '',
      linesJson: (json['Lines'] as List<dynamic>?)
              ?.map((e) => NewLineModelApi.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NewOrderModelApiToJson(NewOrderModelApi instance) =>
    <String, dynamic>{
      'ClientName': instance.clientName,
      'ClientUid': instance.clientUid,
      'Code': instance.code,
      'Comment': instance.comment,
      'DateProcessed': instance.dateProcessed,
      'DateValid': instance.dateValid,
      'DeliveryAddress': instance.deliveryAddress,
      'State': instance.state,
      'StockName': instance.stockName,
      'StockUid': instance.stockUid,
      'Sum': instance.sum,
      'Uid': instance.uid,
      'Lines': instance.linesJson,
    };
