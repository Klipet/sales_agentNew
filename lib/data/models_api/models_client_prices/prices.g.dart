// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      assortimentUid: json['AssortimentUid'] as String? ?? '',
      price: (json['Price'] as num?)?.toDouble() ?? 0.0,
      priceLineUid: json['PriceLineUid'] as String? ?? '',
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'AssortimentUid': instance.assortimentUid,
      'Price': instance.price,
      'PriceLineUid': instance.priceLineUid,
    };
