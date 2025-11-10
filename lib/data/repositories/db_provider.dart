import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_outlens_db.dart';
import 'package:sales_agent/data/models_db/model_login.dart';

import '../models_api/models_client_prices/price_lists.dart';
import '../models_api/models_client_prices/prices.dart';
import '../models_db/model_apikey.dart';
import '../models_db/model_db_assortiment/model_assortiment_db.dart';
import '../models_db/model_db_new_order/new_model_document_id.dart';
import '../models_db/model_db_new_order/new_order_line_model_db.dart';
import '../models_db/model_db_new_order/new_order_model_db.dart';
import '../models_db/model_db_orders/model_document_db.dart';
import '../models_db/model_db_orders/model_lines_db.dart';

class DbProvider {
  static Isar? _isar;

  static Future<Isar> instance() async {
    if (_isar != null) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ModelApikeySchema, ModelLoginSchema, ModelDocumentDbSchema, ModelLinesDbSchema,
        ModelClientDbSchema, ModelOutlensDbSchema, ModelAssortimentDBSchema, PriceListsSchema, PricesSchema,
        NewOrderLineModelDbSchema, NewOrderModelDbSchema, NewModelDocumentIdSchema,
      ],
      directory: dir.path,
    );
    return _isar!;
  }
}