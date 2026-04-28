import '../models_db/model_apikey.dart';
import 'db_provider.dart';

class ApikeyRepository {
  Future<void> saveApiKey({required String key, required String uri, required String licenseCode,required String company}) async {
    final isar = await DbProvider.instance();
    final model = ModelApikey()
      ..id = 0
      ..apiKey = key
      ..codeLicense = licenseCode
      ..company = company
      ..uri = uri;

    await isar.writeTxn(() => isar.modelApikeys.put(model));
  }

  Future<String?> getApiKey() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelApikeys.get(0);
    return settings?.apiKey;
  }

  Future<String?> getCompany() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelApikeys.get(0);
    return settings?.company;
  }

  Future<String?> getlicenseCode() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelApikeys.get(0);
    return settings?.codeLicense;
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
