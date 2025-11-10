import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/repositories/price_repositori.dart';
import 'package:sales_agent/logic/blocs/price_blocs/price_state.dart';

import '../../../data/providers/api_provider/price_list_client_api.dart';

class PriceCubit extends Cubit<PriceState> {
  final PriceListClientApi _priceApi;
  final PriceRepositori priceRepositori;

  PriceCubit(this._priceApi, this.priceRepositori) : super(PriceInitial());

  Future<void> fetchPriceList() async {
    emit(PriceLoading());
    try {
      final price = await _priceApi.getClientPrice();
      if (price != null || price.priceLists.isNotEmpty) {
        await priceRepositori.deletePriceLine();
        await priceRepositori.deletePrice();
        await priceRepositori.saveClientPrice(price);
        emit(PriceLoaded());
      } else {
        emit(PriceError("Не удалось загрузить Прайс клиента"));
      }
    } catch (e) {
      emit(PriceError(e.toString()));
    }
  }
}