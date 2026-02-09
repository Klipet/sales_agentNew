import 'package:json_annotation/json_annotation.dart';


part 'assortiment_model.g.dart';

@JsonSerializable()
class AssortimentModel{
  @JsonKey(name: 'BarCode', defaultValue: '')
  final String? barCode;
  @JsonKey(name: 'Code', defaultValue: '')
  final String? code;
  @JsonKey(name: 'Description', defaultValue: '')
  final String? description;
  @JsonKey(name: 'FullName', defaultValue: '')
  final String? fullName;
  @JsonKey(name: 'IsFolder', defaultValue: false)
  final bool isFolder;
  @JsonKey(name: 'Name', defaultValue: '')
  final String? name;
  @JsonKey(name: 'ParentUid', defaultValue: '')
  final String? parentUid;
  @JsonKey(name: 'Uid', defaultValue: '')
  final String? uid;
  @JsonKey(name: 'CountInPackage', defaultValue: 0)
  final double? countInPackage;
  @JsonKey(name: 'Marking', defaultValue: '')
  final String? marking;
  @JsonKey(name: 'NonWhole', defaultValue: false)
  final bool nonWhole;
  @JsonKey(name: 'Price', defaultValue: 0.0)
  final double? price;
  @JsonKey(name: 'PricelineUid', defaultValue: '')
  final String? pricelineUid;
  @JsonKey(name: 'Remain', defaultValue: 0.0)
  final double? remain;
  @JsonKey(name: 'UnitInPackage', defaultValue: '')
  final String? unitInPackage;
  @JsonKey(name: 'UnitName', defaultValue: '')
  final String? unitName;

  AssortimentModel({
    required this.barCode,
    required this.code,
    required this.description,
    required this.fullName,
    required this.isFolder,
    required this.name,
    required this.parentUid,
    required this.uid,
    required this.countInPackage,
    required this.marking,
    required this.nonWhole,
    required this.price,
    required this.pricelineUid,
    required this.remain,
    required this.unitInPackage,
    required this.unitName,
  });
  factory AssortimentModel.fromJson(Map<String, dynamic> json) =>
      _$AssortimentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssortimentModelToJson(this);
}