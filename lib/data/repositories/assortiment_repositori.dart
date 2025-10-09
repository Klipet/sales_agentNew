import 'package:sales_agent/data/models_api/models_assortiment/assortiment_model.dart';

import '../models_db/model_db_assortiment/model_assortiment_db.dart';
import 'db_provider.dart';

class AssortimentRepositori{


  Future<void> saveAssortiment(AssortimentModel asl) async {
    final isar = await DbProvider.instance();
    final model = ModelAssortimentDB(
        barCode: asl.barCode,
        code: asl.code,
        description: asl.description,
        fullName: asl.fullName,
        isFolder: asl.isFolder,
        name: asl.name,
        parentUid: asl.parentUid,
        uid: asl.uid,
        countInPackage: asl.countInPackage,
        marking: asl.marking,
        nonWhole: asl.nonWhole,
        price: asl.price,
        pricelineUid: asl.pricelineUid,
        remain: asl.remain,
        unitInPackage: asl.unitInPackage,
        unitName: asl.unitName,
    );
    await isar.writeTxn(() => isar.modelAssortimentDBs.put(model));
  }

  Future<void> deleteAssortiment() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelAssortimentDBs.clear());
  }
}