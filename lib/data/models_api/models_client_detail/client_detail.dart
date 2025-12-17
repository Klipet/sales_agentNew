import 'package:json_annotation/json_annotation.dart';

import '../models_client/ourlets_response.dart';
part 'client_detail.g.dart';

@JsonSerializable()
class ClientDetail{
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

  ClientDetail({
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
  factory ClientDetail.fromJson(Map<String, dynamic> json) =>
      _$ClientDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ClientDetailToJson(this);
}