
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'prices.g.dart';
@JsonSerializable()
@collection
class Prices{
  @JsonKey(ignore: true)
  Id id = Isar.autoIncrement;
  @JsonKey(name: 'AssortimentUid', defaultValue: '')
  final String assortimentUid;
  @JsonKey(name: 'Price', defaultValue: 0.0)
  final double price;
  @JsonKey(name: 'PriceLineUid', defaultValue: '')
  final String priceLineUid;


  Prices({
    required this.assortimentUid,
    required this.price,
    required this.priceLineUid,
  });
  factory Prices.fromJson(Map<String, dynamic> json) =>
      _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);
}