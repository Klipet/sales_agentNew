import 'package:json_annotation/json_annotation.dart';

part 'ourlets_response.g.dart';
@JsonSerializable()
class OutletsResponse{
  @JsonKey(name: 'Address')
  final String? address;
  @JsonKey(name: 'Comment')
  final String? comment;

  OutletsResponse({
    this.address,
    this.comment,
  });
  factory OutletsResponse.fromJson(Map<String, dynamic> json) =>
      _$OutletsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OutletsResponseToJson(this);
}