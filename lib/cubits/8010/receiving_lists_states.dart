import 'package:equatable/equatable.dart';
import 'package:kiosk_sf/models/8010/receiving_list.dart';

abstract class ReceivingListsStates extends Equatable{}

class InitialState extends ReceivingListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rlReadyState extends ReceivingListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rlLoadingState extends ReceivingListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rlLoadedState extends ReceivingListsStates {
  rlLoadedState(this.rcvLists);
  final List<ReceivingList> rcvLists;
  @override
  // TODO: implement props
  List<Object> get props => [rcvLists];

}

class rlSessionExpired extends ReceivingListsStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}