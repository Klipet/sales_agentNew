import 'package:json_annotation/json_annotation.dart';

import '../models_documents/token.dart';
import 'client_detail.dart';
part 'detail_client_response.g.dart';
@JsonSerializable()
class DetailClientResponse{
  @JsonKey(name: 'ErrorCode')
  final int errorCode;
  @JsonKey(name: 'ErrorMessage')
  final String? errorMessage;
  @JsonKey(name: 'Token')
  final Token? token;
  @JsonKey(name: 'Contragent', defaultValue: null)
  final ClientDetail contragents;

  DetailClientResponse({
    required this.errorCode,
    this.errorMessage,
    this.token,
    required this.contragents,
  });
  factory DetailClientResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailClientResponseToJson(this);
}