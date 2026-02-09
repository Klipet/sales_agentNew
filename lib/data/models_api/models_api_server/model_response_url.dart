class ModelResponseUrl {
  final int errorCode;
  final String errorMessage;
  final AppData? appData;

  ModelResponseUrl({
    required this.errorCode,
    required this.errorMessage,
    required this.appData,
  });

  factory ModelResponseUrl.fromJson(Map<String, dynamic> json) {
    return ModelResponseUrl(
      errorCode: json['ErrorCode'],
      errorMessage: json['ErrorMessage'] ?? '',
      appData: json['AppData'] != null
          ? AppData.fromJson(json['AppData'])
          : null,
    );
  }
}

class AppData {
  final String licenseCode;
  final String licenseID;
  final int status;
  final String company;
  final String departament;
  final String idNo;
  final int module;
  final List<int> picture;
  final String posid;
  final int product;
  final String serverDateTime;
  final String uri;

  AppData({
    required this.licenseCode,
    required this.licenseID,
    required this.status,
    required this.company,
    required this.idNo,
    required this.module,
    required this.picture,
    required this.product,
    required this.departament,
    required this.posid,
    required this.serverDateTime,
    required this.uri,
  });

  factory AppData.fromJson(Map<String, dynamic> json) {
    return AppData(
      licenseCode: json['LicenseCode'] ?? '',
      licenseID: json['LicenseID'] ?? '',
      status: json['Status'] ?? '',
      company: json['Company'] ?? '',
      posid: json['POSID'] ?? '',
      departament: json['Departament'] ?? '',
      idNo: json['IDNO'] ?? '',
      module: json['Module'] ?? '',
      picture: json['Picture'] != null ? List<int>.from(json['Picture']) : [],
      product: json['Product'] ?? '',
      serverDateTime: json['ServerDateTime'] ?? '',
      uri: json['URI'] ?? '',
    );
  }
}
