import '../models_db/model_apikey.dart';
import 'db_provider.dart';

class ApikeyRepository {
  Future<void> saveApiKey(String key, String uri) async {
    final isar = await DbProvider.instance();
    final model = ModelApikey()
      ..id = 0
      ..apiKey = key
      ..uri = uri;

    await isar.writeTxn(() => isar.modelApikeys.put(model));
  }

  Future<String?> getApiKey() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelApikeys.get(0);
    return settings?.apiKey;
  }

  Future<String?> getUrl() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelApikeys.get(0);
    return settings?.uri;
  }

  Future<void> clearApiKey() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelApikeys.delete(0));
  }
}
