
import 'package:json_annotation/json_annotation.dart';
import 'package:sales_agent/data/models_api/new_order_post/new_line_model_api.dart';
part 'new_order_model_api.g.dart';

@JsonSerializable()
class NewOrderModelApi{


  @JsonKey(name: 'ClientName', defaultValue: '')
  final String clientName;
  @JsonKey(name: 'ClientUid', defaultValue: '')
  final String clientUid;
  @JsonKey(name: 'Code', defaultValue: '')
  final String code;
  @JsonKey(name: 'Comment', defaultValue: '')
  final String comment;
  @JsonKey(name: 'DateProcessed', defaultValue: '')
  final String dateProcessed;
  @JsonKey(name: 'DateValid', defaultValue: '')
  final String dateValid;
  @JsonKey(name: 'DeliveryAddress', defaultValue: '')
  final String deliveryAddress;
  @JsonKey(name: 'State', defaultValue: 0)
  final int state;
  @JsonKey(name: 'StockName', defaultValue: '')
  final String stockName;
  @JsonKey(name: 'StockUid', defaultValue: '')
  final String stockUid;
  @JsonKey(name: 'Sum', defaultValue: 0.0)
  final double sum;
  @JsonKey(name: 'Uid', defaultValue: '')
  final String uid;
  @JsonKey(name: 'Lines', defaultValue: [])
  final List<NewLineModelApi> linesJson;

  NewOrderModelApi({
    required this.clientName,
    required this.clientUid,
    required this.code,
    required this.comment,
    required this.dateProcessed,
    required this.dateValid,
    required this.deliveryAddress,
    required this.state,
    required this.stockName,
    required this.stockUid,
    required this.sum,
    required this.uid,
    required this.linesJson
  });

  factory NewOrderModelApi.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModelApiFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderModelApiToJson(this);
}