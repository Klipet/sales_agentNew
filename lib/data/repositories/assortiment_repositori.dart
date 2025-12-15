import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_model.dart';

import '../models_db/model_db_assortiment/model_assortiment_db.dart';
import 'db_provider.dart';

class AssortimentRepositori {
  Future<void> saveAssortiment(List<AssortimentModel> list) async {
    final isar = await DbProvider.instance();

    final models = list.map((asl) => ModelAssortimentDB(
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
    )).toList();

    final sw = Stopwatch()..start();
    await isar.writeTxn(() async {
      await isar.modelAssortimentDBs.putAll(models);
    });
    print('✅ ${models.length} записей сохранено за ${sw.elapsedMilliseconds} мс');
  }

  Future<void> deleteAssortiment() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelAssortimentDBs.clear());
  }

  Future<List<ModelAssortimentDB>> getAssortiment() async {
    final isar = await DbProvider.instance();

    final items = await isar.modelAssortimentDBs
        .where()
    .findAll();
    print('=== ДАННЫЕ ИЗ БАЗЫ ===');
    print('Всего элементов: ${items.length}');
    return items;
  }

  Future<List<ModelAssortimentDB>> getFolders(String? parentUid) async {
    final isar = await DbProvider.instance();

    final folders = await isar.modelAssortimentDBs
        .filter()
        .parentUidEqualTo(parentUid ?? '')
        .and()
        .isFolderEqualTo(true)
        .findAll();

    return folders;
  }

  Future<List<ModelAssortimentDB>> getProducts(String? parentUid) async {
    final isar = await DbProvider.instance();
    final products = await isar.modelAssortimentDBs
        .filter()
        .parentUidEqualTo(parentUid ?? '')
        .and()
        .isFolderEqualTo(false)
        .findAll();

    return products;
  }
  // Поиск по запросу
  Future<List<ModelAssortimentDB>> searchAssortiment(String query) async {
    final isar = await DbProvider.instance();
    if (query.isEmpty) {
      return await getAssortiment();
    }

    List<ModelAssortimentDB> assortiment;
     assortiment = await isar.modelAssortimentDBs.where().findAll();
    if(query.isNotEmpty){
      print(query);
      final queryResault = query.toLowerCase();
      assortiment = assortiment.where((asl){
        return (asl.code?.toLowerCase().contains(queryResault) ?? false) ||
            (asl.uid?.toLowerCase().contains(queryResault) ?? false) ||
            (asl.fullName?.toLowerCase().contains(queryResault) ?? false)||
            (asl.name?.toLowerCase().contains(queryResault) ?? false)||
            (asl.barCode?.toLowerCase().contains(queryResault) ?? false);
      }).toList();
    }

    print(assortiment.length);
    return assortiment;
  }


}
