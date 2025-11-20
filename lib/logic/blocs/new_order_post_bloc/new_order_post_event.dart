import 'package:equatable/equatable.dart';

import '../../../data/models_db/model_db_new_order/new_order_model_db.dart';

abstract class NewOrderPostEvent extends Equatable {
  const NewOrderPostEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrderPostData extends NewOrderPostEvent {
  final NewOrderModelDb modelDb;

  const FetchOrderPostData(this.modelDb);

  @override
  List<Object?> get props => [modelDb];
}