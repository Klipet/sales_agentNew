import 'package:json_annotation/json_annotation.dart';

part 'detail_outlands.g.dart';

@JsonSerializable()
class DetailOutlands{
  @JsonKey(name: 'Address', defaultValue: '')
  final String address;
  @JsonKey(name: 'Comment', defaultValue: '')
  final String comment;

  DetailOutlands({
    required this.address,
    required this.comment,
  });
  factory DetailOutlands.fromJson(Map<String, dynamic> json) =>
      _$DetailOutlandsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailOutlandsToJson(this);
}