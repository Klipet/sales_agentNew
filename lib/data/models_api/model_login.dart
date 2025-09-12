import 'model_token.dart';

class ModelLogin {
  final int errorCode;
  final String errorMessage;
  final ModelToken token;
  final ModelUser user;

  ModelLogin({
    required this.errorCode,
    required this.errorMessage,
    required this.token,
    required this.user,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) {
    return ModelLogin(
      errorCode: json['ErrorCode'] ?? 0,
      errorMessage: json['ErrorMessage'] ?? '',
      token: json['Token'] != null ? ModelToken.fromJson(json['Token']) : ModelToken.empty(),
      user: json['User'] != null ? ModelUser.fromJson(json['User']) : ModelUser.empty(),
    );
  }

}
class ModelUser {
  final String barCode;
  final String code;
  final String description;
  final String fullName;
  final bool isFolder;
  final String name;
  final String parentUid;
  final String uid;
  final String? idnp;
  final String? patronymic;
  final String? surname;

  ModelUser({
    required this.barCode,
    required this.code,
    required this.description,
    required this.fullName,
    required this.isFolder,
    required this.name,
    required this.parentUid,
    required this.uid,
    this.idnp,
    this.patronymic,
    this.surname,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      barCode: json['BarCode'] ?? '',
      code: json['Code'] ?? '',
      description: json['Description'] ?? '',
      fullName: json['FullName'] ?? '',
      isFolder: json['IsFolder'] ?? false,
      name: json['Name'] ?? '',
      parentUid: json['ParentUid'] ?? '',
      uid: json['Uid'] ?? '',
      idnp: json['IDNP'],
      patronymic: json['Patronymic'],
      surname: json['Surname'],
    );
  }
  /// Конструктор-заглушка для null
  factory ModelUser.empty() => ModelUser(
    barCode: '',
    code: '',
    description: '',
    fullName: '',
    isFolder: false,
    name: '',
    parentUid: '',
    uid: '',
  );
}