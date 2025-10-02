
import 'package:json_annotation/json_annotation.dart';

import '../models_documents/token.dart';
import 'contragent_response.dart';

part 'client_response.g.dart';

@JsonSerializable()
class ClientResponse{
  @JsonKey(name: 'ErrorCode')
  final int errorCode;
  @JsonKey(name: 'ErrorMessage')
  final String? errorMessage;
  @JsonKey(name: 'Token')
  final Token? token;
  @JsonKey(name: 'Contragents')
  final List<ContragentResponse>? contragents;

  ClientResponse({
    required this.errorCode,
    this.errorMessage,
    this.token,
    this.contragents,
  });
  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);
}