import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/models_client/ourlets_response.dart';

part 'contragent_response.g.dart';
@JsonSerializable()
class ContragentResponse{
  @JsonKey(name: 'Balance')
  final double? balance;

  @JsonKey(name: 'Code')
  final String? code;

  @JsonKey(name: 'IDNP')
  final String? idnp;

  @JsonKey(name: 'Image')
  final String? image;

  @JsonKey(name: 'Name')
  final String? name;

  @JsonKey(name: 'Outlets')
  final List<OutletsResponse>? outlets;

  @JsonKey(name: 'PricelistUid')
  final String? pricelistUid;

  @JsonKey(name: 'TVACode')
  final String? tvaCode;

  @JsonKey(name: 'Uid')
  final String? uid;

  ContragentResponse({
    this.balance,
    this.code,
    this.idnp,
    this.image,
    this.name,
    this.outlets,
    this.pricelistUid,
    this.tvaCode,
    this.uid,
  });
  factory ContragentResponse.fromJson(Map<String, dynamic> json) =>
      _$ContragentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContragentResponseToJson(this);
}