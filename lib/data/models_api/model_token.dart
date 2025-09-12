class ModelToken {
  final String deviceUid;
  final String uid;
  final String validTo;

  ModelToken({
    required this.deviceUid,
    required this.uid,
    required this.validTo,
  });

  factory ModelToken.fromJson(Map<String, dynamic> json) {
    return ModelToken(
      deviceUid: json['DeviceUid'] ?? '',
      uid: json['Uid'] ?? '',
      validTo: json['ValidTo'] ?? '',
    );
  }
  factory ModelToken.empty() => ModelToken(
    deviceUid: '',
    uid: '',
    validTo: '',
  );
}