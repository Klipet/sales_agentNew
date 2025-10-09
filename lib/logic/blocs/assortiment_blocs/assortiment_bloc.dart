import 'package:bloc/bloc.dart';
import 'package:sales_agent/data/providers/api_provider/assotriment_api.dart';
import 'package:sales_agent/data/repositories/assortiment_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_state.dart';


class AssortimentBloc extends Cubit<AssortimentState>{
  final AssortimentApi assortimentApi;
  final AssortimentRepositori assortimentRepositori;

  AssortimentBloc(this.assortimentApi, this.assortimentRepositori) : super(AssortimentInitial());

  Future<void> fetchAssortiment() async{
    emit(AssortimentLoading());
    try{
      await assortimentRepositori.deleteAssortiment();
      final asl = await assortimentApi.getAssortiment();
      if(asl.isNotEmpty || asl != null){
        for(var aslItem in asl){
          await assortimentRepositori.saveAssortiment(aslItem);

        }
        emit(AssortimentSuccess(asl));
      }else{
        emit(AssortimentFailure("я не смог загрузить ассортимент"));
      }
    }catch(e){
      emit(AssortimentFailure("я не смог загрузить и сохранить ассортимент"));
    }
  }

}