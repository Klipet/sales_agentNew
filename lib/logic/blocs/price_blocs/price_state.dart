import 'package:sales_agent/data/models_api/models_client_prices/price_lists.dart';

import '../../../data/models_api/models_client_prices/client_prices.dart';

abstract class PriceState{}


class PriceInitial extends PriceState {}

class PriceLoading extends PriceState {}

class PriceLoaded extends PriceState {
}

class PriceError extends PriceState {
  final String message;
  PriceError(this.message);
}