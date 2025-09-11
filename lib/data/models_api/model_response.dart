class ModelResponse{
  final int errorCode;
  final String errorMessage;
  final AppData? appData;

  ModelResponse({
    required this.errorCode,
    required this.errorMessage,
    required this.appData,
  });
  factory ModelResponse.fromJson(Map<String, dynamic> json) {
    return ModelResponse(
      errorCode: json['ErrorCode'],
      errorMessage: json['ErrorMessage'] ?? '',
      appData: json['AppData'] != null ? AppData.fromJson(json['AppData']) : null,
    );
  }
}
class AppData {
  final String licenseCode;
  final String licenseID;
  final int status;
  final String company;
  final String idNo;
  final int module;
  final List<int> picture;
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
    required this.serverDateTime,
    required this.uri,
  });

  factory AppData.fromJson(Map<String, dynamic> json) {
    return AppData(
      licenseCode: json['LicenseCode'] ?? '',
      licenseID: json['LicenseID']?? '',
      status: json['Status']?? '',
      company: json['Company']?? '',
      idNo: json['IDNO']?? '',
      module: json['Module']?? '',
      picture: json['Picture'] != null ? List<int>.from(json['Picture']) : [],
      product: json['Product']?? '',
      serverDateTime: json['ServerDateTime']?? '',
      uri: json['URI']?? '',
    );
  }
}