import 'package:isar/isar.dart';

import '../../../data/models_api/models_client_detail/detail_outlands.dart';
import '../../../data/models_api/models_client_prices/prices.dart';
import '../../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../../data/models_db/model_db_clients/model_client_db.dart';

abstract class NewOrderEvent {}

class CreateOrderEvent extends NewOrderEvent {
  final ModelClientDb client;
  final DetailOutlands? outlet;

  CreateOrderEvent({
    required this.client,
    this.outlet,
  });
}

class AddLineToOrderEvent extends NewOrderEvent {
  final ModelAssortimentDB item;
  final double quantity;
  final Prices? priceSelected;

  AddLineToOrderEvent({
    required this.item,
    required this.quantity,
    this.priceSelected,
  });
}

class RemoveLineFromOrderEvent extends NewOrderEvent {
  final Id lineId;

  RemoveLineFromOrderEvent(this.lineId);
}

class UpdateLineQuantityEvent extends NewOrderEvent {
  final Id lineId;
  final double newQuantity;

  UpdateLineQuantityEvent(this.lineId, this.newQuantity);
}

class LoadOrderEvent extends NewOrderEvent {
  final Id orderId;

  LoadOrderEvent(this.orderId);
}

class DeleteOrderEvent extends NewOrderEvent {}