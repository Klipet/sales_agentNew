// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceLists _$PriceListsFromJson(Map<String, dynamic> json) => PriceLists(
      priceListUid: json['PriceListUid'] as String? ?? '',
      prices: (json['Prices'] as List<dynamic>?)
              ?.map((e) => Prices.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PriceListsToJson(PriceLists instance) =>
    <String, dynamic>{
      'PriceListUid': instance.priceListUid,
      'Prices': instance.prices,
    };
