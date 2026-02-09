import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/models_assortiment/assortiment_model.dart';

import '../models_documents/token.dart';

part 'assortiment_response.g.dart';

@JsonSerializable()
class AssortimentResponse{
  @JsonKey(name: 'ErrorCode')
  final int errorCode;
  @JsonKey(name: 'ErrorMessage', defaultValue: '')
  final String errorMessage;
  @JsonKey(name: 'Token')
  final Token? token;
  @JsonKey(name: 'Assortiment', defaultValue: [])
  final List<AssortimentModel> assortiment;


  AssortimentResponse({
    required this.errorCode,
    required this.errorMessage,
    required this.token,
    required this.assortiment,
  });

  factory AssortimentResponse.fromJson(Map<String, dynamic> json) =>
      _$AssortimentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssortimentResponseToJson(this);
}