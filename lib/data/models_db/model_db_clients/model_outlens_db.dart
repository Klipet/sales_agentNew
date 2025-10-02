
import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';

part 'model_outlens_db.g.dart';

@collection
class ModelOutlensDb{
  Id id = Isar.autoIncrement;
  late String? address;
  late String? comment;
  final client = IsarLink<ModelClientDb>();

  ModelOutlensDb({
    this.address,
    this.comment,
  });

  factory ModelOutlensDb.fromJson(Map<String, dynamic> json) =>
      ModelOutlensDb(
        address: json['Address'] as String?,
        comment: json['Comment'] as String?,
      );
}