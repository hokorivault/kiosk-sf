import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/8010/receiving_lists_states.dart';
import 'package:kiosk_sf/models/8010/receiving_list.dart';
import 'package:kiosk_sf/services/data_service.dart';

class ReceivingListsCubit extends Cubit<ReceivingListsStates> {
  ReceivingListsCubit() : super(InitialState()){
    emit(rlReadyState());
  }

  final _dataService = DataService();

  void getRcvWork8011P_10Q(startDate, endDate, rcvTypeNm, custCd) async {
    try {
      emit(rlLoadingState());
      late final List<ReceivingList> rcvLists;
      rcvLists = await _dataService.getRcvWork8011P_10Q(startDate, endDate, rcvTypeNm, custCd);
      emit(rlLoadedState(rcvLists));
    } catch(e) {
      rethrow;
    }
  }

  void getRcvwork8010F_10Q(rcvNo) async {
    try {
      emit(rlLoadingState());
      late final List<ReceivingList> rcvLists;
      rcvLists = await _dataService.getRcvwork8010F_10Q(rcvNo);

      if(rcvLists != null) {
        emit(rlLoadedState(rcvLists));
      } else {
        emit(rlSessionExpired());
      }
    } catch(e) {
      throw e;
    }
  }

}