import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/models_client/ourlets_response.dart';

part 'contragent_response.g.dart';
@JsonSerializable()
class ContragentResponse{
  @JsonKey(name: 'Balance', defaultValue: 0)
  final double balance;

  @JsonKey(name: 'Code', defaultValue: '')
  final String code;

  @JsonKey(name: 'IDNP', defaultValue: '----')
  final String idnp;

  @JsonKey(name: 'Image',defaultValue: [])
  final List<int> image;

  @JsonKey(name: 'Name', defaultValue: '')
  final String name;

  @JsonKey(name: 'Outlets', defaultValue: [])
  final List<OutletsResponse> outlets;

  @JsonKey(name: 'PricelistUid',defaultValue: '')
  final String pricelistUid;

  @JsonKey(name: 'TVACode', defaultValue: '')
  final String tvaCode;

  @JsonKey(name: 'Uid',defaultValue: '')
  final String uid;

  ContragentResponse({
    required this.balance,
    required this.code,
    required this.idnp,
    required this.image,
    required this.name,
    required this.outlets,
    required this.pricelistUid,
    required this.tvaCode,
    required this.uid,
  });
  factory ContragentResponse.fromJson(Map<String, dynamic> json) =>
      _$ContragentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContragentResponseToJson(this);
}