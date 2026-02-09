import 'package:json_annotation/json_annotation.dart';

import 'image_item.dart';

 part 'assortiment_img_response.g.dart';

@JsonSerializable()
class AssortimentImgResponse {
  @JsonKey(name: 'ErrorCode', defaultValue: 0)
  final int errorCode;
  @JsonKey(name: 'ErrorMessage', defaultValue: '')
  final String errorMessage;
  @JsonKey(name: 'Images', defaultValue: [])
  final List<ImageItem> images;

  AssortimentImgResponse({
    required this.errorCode,
    required this.errorMessage,
    required this.images,
  });
  factory AssortimentImgResponse.fromJson(Map<String, dynamic> json) =>
      _$AssortimentImgResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssortimentImgResponseToJson(this);
}