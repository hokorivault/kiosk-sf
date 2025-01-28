import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/rst/rst_response_states.dart';
import 'package:kiosk_sf/models/rst/rst_response.dart';
import 'package:kiosk_sf/services/data_service.dart';

class RstResponseCubit extends Cubit<RstResponseStates> {
  RstResponseCubit() : super(rstInitialState()){
    emit(rstReadyState());
  }

  final _dataService = DataService();

  void addLotRcvwork8010F_40W(mngDate, vldDate, lot, inspectedQty, rcvDt, dtlSeq, itemCd) async {
    try {
      emit(rstLoadingState());
      late final List<RstResponse> rstResponse;
      rstResponse = await _dataService.addLotRcvwork8010F_40W(mngDate, vldDate, lot, inspectedQty, rcvDt, dtlSeq, itemCd);
      emit(rstSaveSuccessState(rstResponse));
    } catch(e) {
      rethrow;
    }
  }

  void delLotRcvwork8010F_40W(rcvDt, rcvSeq, dtlSeq, lotSeq) async {
    try {
      emit(rstLoadingState());
      late final List<RstResponse> rstResponse;
      rstResponse = await _dataService.delLotRcvwork8010F_40W(rcvDt, rcvSeq, dtlSeq, lotSeq);
      emit(rstDeleteSuccessState(rstResponse));
    } catch(e) {
      rethrow;
    }
  }
}
