import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/0120P/acct_info_lists_states.dart';
import 'package:kiosk_sf/models/0120P/acct_info_list.dart';
import 'package:kiosk_sf/services/data_service.dart';

class AccInfoListsCubit extends Cubit<AccInfoListsStates> {

  AccInfoListsCubit() : super(InitialState()){
    emit(ailReadyState());
  }

  final _dataService = DataService();

  void getComCust0120_10Q(custNm, custType) async {
    try {
      emit(ailLoadingState());
      late final List<AcctInfoList> acctInfoLists;
      acctInfoLists = await _dataService.getComCust0120_10Q(custNm, custType);
      emit(ailLoadedState(acctInfoLists));
    } catch(e) {
      rethrow;
    }
  }
}