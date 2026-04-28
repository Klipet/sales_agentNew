import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/models_api/models_actie_price/post_client_prices_request.dart';
import 'package:sales_agent/data/providers/api_provider/price_actie_api.dart';
import 'package:sales_agent/logic/blocs/price_actie_blocs/price_actie_state.dart';

import '../../../data/repositories/login_repositori.dart';
import '../../../services/app_logger.dart';

class PriceActieBloc extends Cubit<PriceActieState> {
  final PriceActieApi _service;
  final LoginRepository loginRepository;

  PriceActieBloc(this._service, this.loginRepository) : super(PriceActieInitial());

  Future<void> onLoadPrices(String clientUUID, List<String> priceUuid ) async {
    emit(PriceActieLoading());
    try {
      final token = await loginRepository.getToken();
      final body = PostClientPricesRequest(
          clientUid: clientUUID,
          pricelines: priceUuid,
          tokenUid: token.toString());

      final response = await _service.postActiePrice(model: body.toJson());

      if (response.errorCode != 0) {
        await AppLogger().log(
          action: 'PriceActieBloc',
          message: response,
          type: 2,
        );
        emit(PriceActieError(response.errorMessage ?? 'Неизвестная ошибка'));
        return;
      }
      emit(PriceActieLoaded(response));
    } catch (e) {
      await AppLogger().log(
        action: 'PriceActieBloc',
        message: e.toString(),
        type: 2,
      );
      emit(PriceActieError(e.toString()));
    }
  }
}