import 'package:json_annotation/json_annotation.dart';

part 'assortiment_img_body.g.dart';

@JsonSerializable()
class AssotrimentImageBody{
  @JsonKey(name: 'Assortiment', defaultValue: [])
 final List<String> assortimetn;
  @JsonKey(name: 'TokenUid', defaultValue: '')
 final String token;

 AssotrimentImageBody({
   required this.assortimetn,
   required this.token
});
  factory AssotrimentImageBody.fromJson(Map<String, dynamic> json) =>
      _$AssotrimentImageBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AssotrimentImageBodyToJson(this);
}