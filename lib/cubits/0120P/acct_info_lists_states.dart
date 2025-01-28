import 'package:equatable/equatable.dart';
import 'package:kiosk_sf/models/0120P/acct_info_list.dart';

abstract class AccInfoListsStates extends Equatable {}

class InitialState extends AccInfoListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ailReadyState extends AccInfoListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ailLoadingState extends AccInfoListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class ailLoadedState extends AccInfoListsStates {
  ailLoadedState(this.rcvLists);
  final List<AcctInfoList> rcvLists;
  @override
  // TODO: implement props
  List<Object> get props => [rcvLists];

}