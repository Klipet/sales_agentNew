import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_agent/logic/blocs/assortiment_image_bloc/assotriment_img_state.dart';

import '../../../data/models_api/models_assortiment/assortiment_img_body.dart';
import '../../../data/providers/api_provider/assortiment_img_api.dart';
import '../../../data/repositories/login_repositori.dart';

class AssortimentImgCubit extends Cubit<AssotrimentImgState>{
  final AssortimentImgApi aslImg;
  final LoginRepository loginRepository;

  AssortimentImgCubit(this.aslImg, this.loginRepository): super (ImgInitial());

  Future<void> loadImg({required String aslUuid}) async{
    emit(ImgLoading());
    try{
      final token = await loginRepository.getToken();
      List<String> aslUid = [aslUuid];
      final imgBody = AssotrimentImageBody(
          assortimetn: aslUid,
          token: token!,
      );

      final imgResponse = await aslImg.postImg(orderData: imgBody.toJson());
      print("${imgResponse.errorMessage} ClientDetailBloc");
      if(imgResponse.errorCode != 0){
        emit(ImgFailure(imgResponse.errorMessage.toString()));
      }
      emit(ImgSuccess(imgResponse));
    }catch(e){
      emit(ImgFailure(e.toString()));
    }
  }
}