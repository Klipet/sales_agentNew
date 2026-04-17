import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_api/model_comment_clietn.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_client_db.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_comment_client_db.dart';

import 'db_provider.dart';

class ClientCommentRepository {
  Future<void> saveComment({required int clientId, required ModelCommentClient comment}) async {
    final isar = await DbProvider.instance();
    final commentClient = ModelCommentClientDb()
      ..surName = comment.surName ?? ''
      ..comment = comment.comment ?? ''
      ..address = comment.address ?? ''
      ..phone = comment.phone ?? ''
      ..name = comment.name ?? ''
      ..clientUUid = comment.clientUUid
      ..saveComment = comment.saveComment;
    await isar.writeTxn(() async {
      final client = await isar.modelClientDbs.get(clientId);
      if (client == null) return;

      await client.commentClient.load();

      // удалить старый
      if (client.commentClient.isNotEmpty) {
        await isar.modelCommentClientDbs.delete(client.commentClient.first.id);
        client.commentClient.clear();
      }
      await isar.modelCommentClientDbs.put(commentClient);
      client.commentClient.add(commentClient);
      await client.commentClient.save();
    });
  }



  Future<ModelCommentClientDb?> getComment(int clientId) async {
    final isar = await DbProvider.instance();
    final client = await isar.modelClientDbs.get(clientId);
    if (client == null) return null;
    await client.commentClient.load();
    return client.commentClient.firstOrNull;
  }



  Future<List<ModelCommentClientDb>> getAllComments() async {
    final isar = await DbProvider.instance();
    return await isar.modelCommentClientDbs.where().findAll();
  }

  // ✅ Сохранить напрямую по clientId
  Future<void> saveCommentById(String clientUUid, ModelCommentClientDb comment) async {
    final isar = await DbProvider.instance();
    final client = await isar.modelClientDbs.filter().uidEqualTo(clientUUid).findFirst();
    if(client == null) return;
    await isar.writeTxn(() async {
      client.commentClient.add(comment);
      await client.commentClient.save();
    });
  }
}
