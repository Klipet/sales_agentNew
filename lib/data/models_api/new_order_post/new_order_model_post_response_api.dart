import 'package:json_annotation/json_annotation.dart';

import '../models_documents/token.dart';

part 'new_order_model_post_response_api.g.dart';

@JsonSerializable()
class NewOrderModelPostResponseApi{
  @JsonKey(name: 'ErrorCode', defaultValue: 0)
  final int errorCode;
  @JsonKey(name: 'ErrorMessage', defaultValue: '')
  final String errorMessage;
  @JsonKey(name: 'Token')
  final Token? token;
  @JsonKey(name: 'Code', defaultValue: '')
  final String code;
  @JsonKey(name: 'State', defaultValue: 0)
  final int state;
  @JsonKey(name: 'Uid', defaultValue: '')
  final String uuid;

  NewOrderModelPostResponseApi({
    required this.errorCode,
    required this.errorMessage,
    this.token,
    required this.code,
    required this.state,
    required this.uuid,
  });

  factory NewOrderModelPostResponseApi.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModelPostResponseApiFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderModelPostResponseApiToJson(this);

}
