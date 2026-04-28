import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_comment_client_db.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_outlens_db.dart';
import 'package:sales_agent/data/repositories/client_comment_repository.dart';

import '../models_api/models_client/contragent_response.dart';
import 'db_provider.dart';

class ClientRepositori {


  Future<void> saveClient(List<ContragentResponse> clients) async {
    final isar = await DbProvider.instance();
    final clientCommentRepository = ClientCommentRepository();
    final saveComment = await clientCommentRepository.getAllComments();


    final List<ModelClientDb> dbList = [];
    final List<ModelOutlensDb> outlensList = [];

    for (var client in clients) {
      final db = ModelClientDb(
        balance: client.balance ?? 0.0,
        code: client.code ?? '----',
        idnp: client.idnp ?? '----',
        image: client.image ?? [],
        name: client.name ?? '----',
        pricelistUid: client.pricelistUid ?? '----',
        tvaCode: client.tvaCode ?? '----',
        uid: client.uid ?? '',
      );

      final outlens = client.outlets
          ?.map((o) => ModelOutlensDb(
        address: o.address ?? '',
        comment: o.comment ?? '',
      )).toList() ?? [];

      db.outlets.addAll(outlens); // связываем до транзакции
      dbList.add(db);
      outlensList.addAll(outlens);
    }

    await isar.writeTxn(() async {
      await isar.modelClientDbs.putAll(dbList);       // все клиенты за раз
      await isar.modelOutlensDbs.putAll(outlensList); // все аутлеты за раз

      // сохраняем связи
      for (final db in dbList) {
        await db.outlets.save();
      }
    });

    for (final comment in saveComment) {
      final exists = clients.any((c) => c.uid == comment.clientUUid);
      if (exists) {
        await clientCommentRepository.saveCommentById(comment.clientUUid ?? '', comment);
        print("${exists} =====  ${comment.clientUUid} ----------- ${comment}");
      }
    }

  }

  Future<List<ModelClientDb>> getAllClients() async {
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

  Future<List<ModelClientDb>> filterClient(String searchQuery) async {
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

  Future<ModelClientDb?> getClientByUuid(String uuid) async {
    final isar = await DbProvider.instance();
    final client = await isar.modelClientDbs
        .filter()
        .uidContains(uuid)
        .findFirst();
    return client;
  }

  Future<List<ModelOutlensDb>> getOutlets(String uuid) async {
    try {
      final isar = await DbProvider.instance();

      final client = await isar.modelClientDbs
          .filter()
          .uidEqualTo(uuid)
          .findFirst();

      if (client == null) {
        print('Клиент с uuid $uuid не найден');
        return [];
      }

      // Если outlets - это список (IsarLinks)
      await client.outlets.load();
      return client.outlets.toList();
    } catch (e) {
      print('Ошибка при получении outlets: $e');
      return [];
    }
  }

  Future<ModelOutlensDb?> getOutletsOrder(
    ModelClientDb client,
    String orderAdres,
  ) async {
    try {
      final isar = await DbProvider.instance();

      final outlend = await isar.modelOutlensDbs
          .filter()
          .client((q) => q.idEqualTo(client.id)) // Точка принадлежит этому клиенту
          .and()
          .group((q) => q // Группируем условия OR
          .addressEqualTo(orderAdres)
          .or()
          .commentContains(orderAdres)) // Contains вместо EqualTo для поиска
          .findFirst();

      if (outlend == null) {
        print('Клиент с uuid $client не найден');
        return null;
      }

      // Если outlets - это список (IsarLinks)
      return outlend;
    } catch (e) {
      print('Ошибка при получении outlets: $e');
      return null;
    }
  }
}
