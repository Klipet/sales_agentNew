
import 'package:json_annotation/json_annotation.dart';

part 'image_item.g.dart';

@JsonSerializable()
class ImageItem {
  @JsonKey(name: 'Image1', defaultValue: [])
  final List<int>? image1;
  @JsonKey(name: 'Image2', defaultValue: [])
  final List<int>? image2;
  @JsonKey(name: 'Image3', defaultValue: [])
  final List<int>? image3;
  @JsonKey(name: 'Image4', defaultValue: [])
  final List<int>? image4;
  @JsonKey(name: 'Uid', defaultValue: '')
  final String uid;

  ImageItem({
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    required this.uid,
  });
  factory ImageItem.fromJson(Map<String, dynamic> json) =>
      _$ImageItemFromJson(json);

  Map<String, dynamic> toJson() => _$ImageItemToJson(this);
}
