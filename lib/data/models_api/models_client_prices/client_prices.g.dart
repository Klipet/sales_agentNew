// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientPrices _$ClientPricesFromJson(Map<String, dynamic> json) => ClientPrices(
      errorCode: (json['ErrorCode'] as num?)?.toInt() ?? 0,
      errorMessage: json['ErrorMessage'] as String? ?? '',
      priceLists: (json['PriceLists'] as List<dynamic>?)
              ?.map((e) => PriceLists.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientPricesToJson(ClientPrices instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'Token': instance.token,
      'PriceLists': instance.priceLists,
    };
