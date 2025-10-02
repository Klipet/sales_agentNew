import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_outlens_db.dart';

import '../models_api/models_client/contragent_response.dart';
import 'db_provider.dart';

class ClientRepositori{

  Future<void> saveClient(ContragentResponse client) async {
    final isar = await DbProvider.instance();
     List<ModelOutlensDb> outlens = [];
    final db = ModelClientDb(
      balance: client.balance ?? 0.0,
      code: client.code ?? '----',
      idnp: client.idnp ?? '----',
      image: client.image ?? '----',
      name: client.name ?? '----',
      pricelistUid: client.pricelistUid ?? '----',
      tvaCode: client.tvaCode ?? '----',
      uid: client.uid ?? '',

    );
    if(client.outlets == null){

    }else{
      outlens = client.outlets!.map((outlents) {
        return ModelOutlensDb(
            address: outlents.address ?? '',
            comment: outlents.comment ?? ''
        );
      }).toList();
    }


    await isar.writeTxn(() async {
      await isar.modelClientDbs.put(db); // сначала документ
      await isar.modelOutlensDbs.putAll(outlens); // потом строки
      // связываем через IsarLinks
      db.outlets.addAll(outlens);
      await db.outlets.save();
    });
  }


  Future<List<ModelClientDb>> getAllClients() async{
    final isar = await DbProvider.instance();
    final client = await isar.modelClientDbs.where().findAll();
    return client;
  }

  Future<void> deleteClient() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelClientDbs.clear());
  }

  Future<void> deleteOutlens() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelOutlensDbs.clear());
  }

  Future<List<ModelClientDb>> filterClient( String searchQuery,) async {
    final isar = await DbProvider.instance();

    List<ModelClientDb> client;
    // Получить все заказы
    client = await isar.modelClientDbs.where().findAll();
    // Поиск по тексту в памяти
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      client = client.where((order) {
        return (order.name?.toLowerCase().contains(query) ?? false) ||
            (order.idnp?.toLowerCase().contains(query) ?? false) ||
            (order.code?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    return client;
  }

  Future<int> countOutlans(ModelClientDb clientDB) async {

    // нужно загрузить связи явно
    await clientDB.outlets.load();
    return clientDB.outlets.length;
  }
}