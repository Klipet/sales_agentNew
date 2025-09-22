import 'package:isar/isar.dart';
import 'package:sales_agent/core/utils/convert_data.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';
part 'model_document_db.g.dart';
@collection
class ModelDocumentDb {
  Id id = Isar.autoIncrement;

  late String? clientName;
  late String clientUid;
  late String code;
  late String? comment;
  late String? dateProcessed;
  late DateTime dateValid;
  late String? deliveryAddress;
  late int state;
  late String? stockName;
  late String stockUid;
  late double sum;
  late String uid;

  final lines = IsarLinks<ModelLinesDb>();

  ModelDocumentDb({
    this.clientName,
    required this.clientUid,
    required this.code,
    this.comment,
    this.dateProcessed,
    required this.dateValid,
    this.deliveryAddress,
    required this.state,
    this.stockName,
    required this.stockUid,
    required this.sum,
    required this.uid,
  });
  factory ModelDocumentDb.fromJson(Map<String, dynamic> json) {
    return ModelDocumentDb(
      clientName: json['ClientName'] as String?,
      clientUid: json['ClientUid'] as String,
      code: json['Code'] as String,
      comment: json['Comment'] as String?,
      dateProcessed: json['DateProcessed'] as String?,
      dateValid: ConvertData().convertDate(json['DateValid'])?? DateTime.now(),
      deliveryAddress: json['DeliveryAddress'] as String?,
      state: (json['State'] as num).toInt(),
      stockName: json['StockName'] as String?,
      stockUid: json['StockUid'] as String,
      sum: (json['Sum'] as num).toDouble(),
      uid: json['Uid'] as String,
    );
  }


}