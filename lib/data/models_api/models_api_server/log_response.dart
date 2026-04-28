class LogResponse{
  final int errorCode;
  final String errorMessage;
  final String? errorName;

  LogResponse({
    required this.errorCode,
    required this.errorMessage,
    required this.errorName,
});
  factory LogResponse.fromJson(Map<String, dynamic> json) {
    return LogResponse(
      errorCode: json['ErrorCode'],
      errorMessage: json['ErrorMessage'] ?? '',
      errorName: json['errorName'] ?? '',
    );
  }
}