import 'package:json_annotation/json_annotation.dart';
part 'token.g.dart';
@JsonSerializable()
class Token {
  @JsonKey(name: 'DeviceUid')
  final String deviceUid;

  @JsonKey(name: 'Uid')
  final String uid;

  @JsonKey(name: 'ValidTo')
  final String validTo;

  Token({
    required this.deviceUid,
    required this.uid,
    required this.validTo,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}