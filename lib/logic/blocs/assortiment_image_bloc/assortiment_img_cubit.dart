import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sales_agent/logic/blocs/assortiment_image_bloc/assotriment_img_state.dart';

import '../../../data/models_api/models_assortiment/assortiment_img_body.dart';
import '../../../data/providers/api_provider/assortiment_img_api.dart';
import '../../../data/repositories/login_repositori.dart';

class AssortimentImgCubit extends Cubit<AssotrimentImgState> {
  final AssortimentImgApi aslImg;
  final LoginRepository loginRepository;
  http.Client? _client;

  AssortimentImgCubit(this.aslImg, this.loginRepository) : super(ImgInitial());

  @override
  Future<void> close() {
    // разрываем соединение при закрытии Cubit
    _client?.close();
    return super.close();
  }

  Future<void> loadImg({required String aslUuid}) async {

    if (isClosed) return;
    _client = http.Client();
    emit(ImgLoading());

    try {
      final token = await loginRepository.getToken();
      if (isClosed) return;

      List<String> aslUid = [aslUuid];

      final imgBody = AssotrimentImageBody(
        assortimetn: aslUid,
        token: token!,
      );

      final imgResponse = await aslImg.postImg(orderData: imgBody.toJson(),  client: _client!,);

      if (isClosed) return;

      print(imgResponse.images);
      print("${imgResponse.errorMessage} ClientDetailBloc");

      if (imgResponse.errorCode != 0) {
        emit(ImgFailure(imgResponse.errorMessage.toString()));
        return;
      }

      emit(ImgSuccess(imgResponse));

    } catch (e) {
      if (isClosed) return;
      emit(ImgFailure(e.toString()));
    }
  }
}