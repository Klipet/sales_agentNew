import 'package:isar/isar.dart';

import 'model_client_db.dart';

part 'model_comment_client_db.g.dart';

@collection
class ModelCommentClientDb {
  Id id = Isar.autoIncrement;

  late String? phone;
  late String? name;
  late String? surName;
  late String? address;
  late String? comment;
  late String? clientUUid;
  bool saveComment = false;

  @Backlink(to: 'commentClient')
  final commentClient = IsarLink<ModelClientDb>();

  ModelCommentClientDb({
    this.name,
    this.phone,
    this.comment,
    this.address,
    this.surName,
    this.clientUUid,
  });
}
