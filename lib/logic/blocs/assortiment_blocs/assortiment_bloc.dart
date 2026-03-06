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
    /*  final asl = await assortimentApi.getAssortiment();
      if(asl.isEmpty){
        print(asl);
        emit(AssortimentFailureNonInternet(404));
      }else{
        await assortimentRepositori.deleteAssortiment();
        await assortimentRepositori.saveAssortiment(asl);
      //  if(!isClosed){

      //  }
        emit(AssortimentSuccess(asl));
      }
     */
      await assortimentRepositori.syncAssortiment();
      final data = await assortimentRepositori.getLocalAssortiment();
      if (!isClosed) {
        emit(AssortimentSuccess(data));
      }
    }catch(e){
    //  if(!isClosed){
        emit(AssortimentFailure("я не смог загрузить и сохранить ассортимент"));
    //  }
    }
  }

}