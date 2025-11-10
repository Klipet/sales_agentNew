import 'package:isar/isar.dart';

part 'new_model_document_id.g.dart';
@collection
class NewModelDocumentId {
  Id id = Isar.autoIncrement;
  late int dicumentId; // Сделайте nullable вместо late

}