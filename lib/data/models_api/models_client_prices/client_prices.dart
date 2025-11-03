import 'package:json_annotation/json_annotation.dart';

import '../models_documents/token.dart';
import 'price_lists.dart';
part 'client_prices.g.dart';
@JsonSerializable()
class ClientPrices{
  @JsonKey(name: 'ErrorCode', defaultValue: 0)
  final int errorCode;
  @JsonKey(name: 'ErrorMessage', defaultValue: '')
  final String? errorMessage;
  @JsonKey(name: 'Token')
  final Token? token;
  @JsonKey(name: 'PriceLists', defaultValue: [])
  final List<PriceLists> priceLists;

  ClientPrices({
    required this.errorCode,
    required this.errorMessage,
    required this.priceLists,
    this.token,
  });
  factory ClientPrices.fromJson(Map<String, dynamic> json) =>
      _$ClientPricesFromJson(json);

  Map<String, dynamic> toJson() => _$ClientPricesToJson(this);

}