
import 'package:json_annotation/json_annotation.dart';

import 'prices.dart';
part 'price_lists.g.dart';
@JsonSerializable()
class PriceLists{
  @JsonKey(name: 'PriceListUid', defaultValue: '')
  final String priceListUid;
  @JsonKey(name: 'Prices', defaultValue: [])
  final List<Prices> prices;

  PriceLists({
    required this.priceListUid,
    required this.prices,
  });
  factory PriceLists.fromJson(Map<String, dynamic> json) =>
      _$PriceListsFromJson(json);

  Map<String, dynamic> toJson() => _$PriceListsToJson(this);

}