
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'prices.dart';
part 'price_lists.g.dart';
@JsonSerializable()
@collection
class PriceLists{
  @JsonKey(ignore: true)
  Id id = Isar.autoIncrement;
  @JsonKey(name: 'PriceListUid', defaultValue: '')
  final String priceListUid;

  @ignore
  @JsonKey(name: 'Prices', defaultValue: [])
  List<Prices>? prices = [];

  /// 👇 Это реальное поле для Isar (связи)
  final lines = IsarLinks<Prices>();

  PriceLists({
    required this.priceListUid,
  });
  factory PriceLists.fromJson(Map<String, dynamic> json) =>
      _$PriceListsFromJson(json);

  Map<String, dynamic> toJson() => _$PriceListsToJson(this);

}