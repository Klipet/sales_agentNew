import 'package:sales_agent/data/models_api/models_actie_price/client_price_response.dart';

abstract class PriceActieState {}

class PriceActieInitial extends PriceActieState {}

class PriceActieLoading extends PriceActieState {}

class PriceActieLoaded extends PriceActieState {
  final ClientPriceResponse response;
  PriceActieLoaded(this.response);
}

class PriceActieError extends PriceActieState {
  final String message;
  PriceActieError(this.message);
}