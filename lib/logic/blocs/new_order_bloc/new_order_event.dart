import 'package:isar/isar.dart';
import 'package:sales_agent/data/models_api/models_client/ourlets_response.dart';
import 'package:sales_agent/data/models_api/models_client_detail/client_detail.dart';
import 'package:sales_agent/data/models_db/model_db_clients/model_outlens_db.dart';

import '../../../data/models_api/models_client_prices/prices.dart';
import '../../../data/models_db/model_db_assortiment/model_assortiment_db.dart';
import '../../../data/models_db/model_db_clients/model_client_db.dart';

abstract class NewOrderEvent {}

class CreateOrderEvent extends NewOrderEvent {
  final ModelClientDb client;
  final OutletsResponse? outlet;
  final int? page;

  CreateOrderEvent({
    required this.client,
    this.outlet,
    this.page,
  });
}
class AddOrderOutlentEvent extends NewOrderEvent {
  final ModelClientDb client;
  final ClientDetail? clientDetail;
  final OutletsResponse? outlet;
  final ModelOutlensDb? modelOutlensDb;
  final int? page;
  final int? id;

  AddOrderOutlentEvent({
    this.clientDetail,
    required this.client,
    this.modelOutlensDb,
    this.outlet,
    this.page,
    this.id,
  });
}

class AddLineToOrderEvent extends NewOrderEvent {
  final ModelAssortimentDB item;
  final double quantity;
  final Prices? priceSelected;
  final int? id;

  AddLineToOrderEvent({
    required this.item,
    required this.quantity,
    required this.id,
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


class LoadLineCountEvent extends NewOrderEvent {
  final int orderId;

  LoadLineCountEvent(this.orderId);

}




class DeleteOrderEvent extends NewOrderEvent {}

class AddCommentEvent extends NewOrderEvent {
  final int orderId;
  final String comment;
  AddCommentEvent(this.orderId, this.comment);
}

class LoadCommentEvent extends NewOrderEvent {
  final int orderId;

  LoadCommentEvent(this.orderId);
}