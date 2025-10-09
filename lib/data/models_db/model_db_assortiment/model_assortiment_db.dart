
import 'package:isar/isar.dart';
part 'model_assortiment_db.g.dart';

@collection
class ModelAssortimentDB{
  Id id = Isar.autoIncrement;
  late String? barCode;
  late String? code;
  late String? description;
  late String? fullName;
  late bool? isFolder;
  late String? name;
  late String? parentUid;
  late String? uid;
  late double? countInPackage;
  late String? marking;
  late bool? nonWhole;
  late double? price;
  late String? pricelineUid;
  late double? remain;
  late String? unitInPackage;
  late String? unitName;

  ModelAssortimentDB({
    this.barCode,
    this.code,
    this.description,
    this.fullName,
    this.isFolder,
    this.name,
    this.parentUid,
    this.uid,
    this.countInPackage,
    this.marking,
    this.nonWhole,
    this.price,
    this.pricelineUid,
    this.remain,
    this.unitInPackage,
    this.unitName,
  });
  factory ModelAssortimentDB.fromJson(Map<String, dynamic> json) =>
      ModelAssortimentDB(
        barCode: json['BarCode'] as String? ?? '',
        code: json['Code'] as String? ?? '',
        description: json['Description'] as String? ?? '',
        fullName: json['FullName'] as String? ?? '',
        isFolder: json['IsFolder'] as bool? ?? false,
        name: json['Name'] as String? ?? '',
        parentUid: json['ParentUid'] as String? ?? '',
        uid: json['Uid'] as String? ?? '',
        countInPackage: (json['CountInPackage'] as num?)?.toDouble() ?? 0,
        marking: json['Marking'] as String? ?? '',
        nonWhole: json['NonWhole'] as bool? ?? false,
        price: (json['Price'] as num?)?.toDouble() ?? 0.0,
        pricelineUid: json['PricelineUid'] as String? ?? '',
        remain: (json['Remain'] as num?)?.toDouble() ?? 0.0,
        unitInPackage: json['UnitInPackage'] as String? ?? '',
        unitName: json['UnitName'] as String? ?? '',
      );
}