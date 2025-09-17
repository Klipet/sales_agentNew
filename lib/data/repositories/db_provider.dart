import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_agent/data/models_db/model_login.dart';

import '../models_db/model_apikey.dart';
import '../models_db/model_db_orders/model_document_db.dart';
import '../models_db/model_db_orders/model_lines_db.dart';

class DbProvider {
  static Isar? _isar;

  static Future<Isar> instance() async {
    if (_isar != null) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ModelApikeySchema, ModelLoginSchema, ModelDocumentDbSchema, ModelLinesDbSchema],
      directory: dir.path,
    );
    return _isar!;
  }
}