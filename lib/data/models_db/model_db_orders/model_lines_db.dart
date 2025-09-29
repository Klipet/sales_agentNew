import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_document_db.dart';

part 'model_lines_db.g.dart';

@collection
class ModelLinesDb {
  Id id = Isar.autoIncrement;

  late String assortimentBarcode;
  late String assortimentCode;
  late String assortimentName;
  late String assortimentUid;
  late double count;
  late int lineNumber;
  late double price;
  late double processedCount;
  late  double sum;
  late String uid;
  late String unitName;
  late String unitUid;
  final document = IsarLink<ModelDocumentDb>();

  ModelLinesDb({
    required this.assortimentBarcode,
    required this.assortimentCode,
    required this.assortimentName,
    required this.assortimentUid,
    required this.count,
    required this.lineNumber,
    required this.price,
    required this.processedCount,
    required this.sum,
    required this.uid,
    required this.unitName,
    required this.unitUid,
  });

  factory ModelLinesDb.fromJson(Map<String, dynamic> json) {
    return ModelLinesDb(
      assortimentBarcode: json['AssortimentBarcode'] as String,
      assortimentCode: json['AssortimentCode'] as String,
      assortimentName: json['AssortimentName'] as String,
      assortimentUid: json['AssortimentUid'] as String,
      count: (json['Count'] as num).toDouble(),
      lineNumber: (json['LineNumber'] as num).toInt(),
      price: (json['Price'] as num).toDouble(),
      processedCount: (json['ProcessedCount'] as num).toDouble(),
      sum: (json['Sum'] as num).toDouble(),
      uid: json['Uid'] as String,
      unitName: json['UnitName'] as String,
      unitUid: json['UnitUid'] as String,

    );
  }
}