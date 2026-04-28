
import 'package:isar/isar.dart';
import 'model_comment_client_db.dart';
import 'model_outlens_db.dart';

part 'model_client_db.g.dart';

@collection
class ModelClientDb{
  Id id = Isar.autoIncrement;
  late double? balance;
  late String? code;
  late String? idnp;
  late List<int>? image;
  late String? name;
  late String? pricelistUid;
  late String? tvaCode;
  late String? uid;
  final outlets = IsarLinks<ModelOutlensDb>();
  final commentClient = IsarLinks<ModelCommentClientDb>();

  ModelClientDb({
    this.balance,
    this.code,
    this.idnp,
    this.image,
    this.name,
    this.pricelistUid,
    this.tvaCode,
    this.uid,
  });
  factory ModelClientDb.fromJson(Map<String, dynamic> json) =>
      ModelClientDb(
        balance: (json['Balance'] as num?)?.toDouble(),
        code: json['Code'] as String?,
        idnp: json['IDNP'] as String?,
        image: json['Image'] as List<int>,
        name: json['Name'] as String?,
        pricelistUid: json['PricelistUid'] as String?,
        tvaCode: json['TVACode'] as String?,
        uid: json['Uid'] as String?,
      );
}