import 'package:equatable/equatable.dart';
import 'package:kiosk_sf/models/8010/receiving_list_detail.dart';

abstract class ReceivingListDetailStates extends Equatable{}

class rldInitialState extends ReceivingListDetailStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rldReadyState extends ReceivingListDetailStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rldLoadingState extends ReceivingListDetailStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rldLoadedState extends ReceivingListDetailStates {
  rldLoadedState(this.rcvListDetail);
  final List<ReceivingListDetail> rcvListDetail;
  @override
  // TODO: implement props
  List<Object> get props => [rcvListDetail];

}