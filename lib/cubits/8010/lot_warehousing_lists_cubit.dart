import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/8010/lot_warehousing_lists_states.dart';
import 'package:kiosk_sf/services/data_service.dart';


class LotWarehousingListsCubit extends Cubit<LotWarehousingListsStates> {
  LotWarehousingListsCubit() : super(InitialState()){
    emit(lwlReadyState());
  }

  final _dataService = DataService();

  void getRcvWork8010F_30Q(rcvDt, rcvSeq, dtlSeq) async {
    try {
      emit(lwlLoadingState());
      late final lotWarehousingLists;
      lotWarehousingLists = await _dataService.getRcvWork8010F_30Q(rcvDt, rcvSeq, dtlSeq);
      emit(lwlLoadedState(lotWarehousingLists));
    } catch(e) {
      rethrow;
    }
  }

}