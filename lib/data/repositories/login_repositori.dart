import 'package:sales_agent/data/models_db/model_login.dart';

import 'db_provider.dart';

class LoginRepository {
  Future<void> saveLogin(
    String login,
    String password,
    String token,
    String validTo,
      bool savePass
  ) async {
    final isar = await DbProvider.instance();
    final model = ModelLogin()
      ..id = 0
      ..login = login
      ..password = password
      ..tokenUid = token
      ..tokenValid = validTo
    ..savePass = savePass;

    await isar.writeTxn(() => isar.modelLogins.put(model));
  }

  Future<String?> getToken() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelLogins.get(0);
    return settings?.tokenUid;
  }

  Future<String?> getLogin() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelLogins.get(0);
    return settings?.login;
  }

  Future<String?> getPassword() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelLogins.get(0);
    return settings?.password;
  }

  Future<String?> getValodTo() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelLogins.get(0);
    return settings?.tokenValid;
  }
  Future<bool?> getSavePassword() async {
    final isar = await DbProvider.instance();
    final settings = await isar.modelLogins.get(0);
    return settings?.savePass;
  }

  Future<void> clear() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.modelLogins.delete(0));
  }
}
