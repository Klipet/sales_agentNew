import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_orders/model_lines_db.dart';

import '../../../core/utils/convert_data.dart';
part 'model_document_db.g.dart';
@collection
class ModelDocumentDb {

  Id id = Isar.autoIncrement;
  late String? clientName;
  late String clientUid;
  late String code;
  late String comment;
  late DateTime dateProcessed;
  late DateTime dateValid;
  late String deliveryAddress;
  late int state;
  late String? stockName;
  late String stockUid;
  late double sum;
  late String uid;

  final lines = IsarLinks<ModelLinesDb>();


}