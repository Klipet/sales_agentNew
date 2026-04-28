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
  late double priceSpecial;
  late double priceActie;
  late double processedCount;
  late double sum;
  late String uid;
  late String lineUuid;
  late String unitName;
  late String unitUid;
  late bool nonWhole;
  late double remain;
  final document = IsarLink<ModelDocumentDb>();
}