import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/providers/api_provider/assotriment_api.dart';
import 'package:sales_agent/data/repositories/assortiment_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_state.dart';

import '../../../services/app_logger.dart';


class AssortimentBloc extends Cubit<AssortimentState>{
  final AssortimentApi assortimentApi;
  final AssortimentRepositori assortimentRepositori;

  AssortimentBloc(this.assortimentApi, this.assortimentRepositori) : super(AssortimentInitial());

  Future<void> fetchAssortiment() async{
    emit(AssortimentLoading());
    try{
      await assortimentRepositori.syncAssortiment();
      final data = await assortimentRepositori.getLocalAssortiment();
      if (!isClosed) {
        emit(AssortimentSuccess(data));
      }
    }catch(e){
    //  if(!isClosed){
      await AppLogger().log(
        action: 'AssortimentBloc',
        message: e,
        details: "Ошибка занрузки данных",
        type: 2,
      );
        emit(AssortimentFailure("я не смог загрузить и сохранить ассортимент"));
    //  }
    }
  }

}