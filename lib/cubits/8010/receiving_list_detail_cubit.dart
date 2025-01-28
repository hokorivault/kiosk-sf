import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/8010/receiving_list_detail_states.dart';
import 'package:kiosk_sf/services/data_service.dart';

class ReceivingListDetailCubit extends Cubit<ReceivingListDetailStates> {
  ReceivingListDetailCubit() : super(rldInitialState()){
    emit(rldReadyState());
  }

  final _dataService = DataService();

  void getRcvwork8010F_20Q(rcvDt, rcvSeq) async {
    try {
      emit(rldLoadingState());
      late final rcvListDetail;
      rcvListDetail = await _dataService.getRcvwork8010F_20Q(rcvDt, rcvSeq);
      emit(rldLoadedState(rcvListDetail));
    } catch(e) {
      rethrow;
    }
  }

}