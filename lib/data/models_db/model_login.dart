import 'package:isar/isar.dart';

part 'model_login.g.dart';

@collection
class ModelLogin {
  Id id = 0;
  late String login;
  late String password;
  late String tokenUid;
  late String tokenValid;
  late bool savePass;
}