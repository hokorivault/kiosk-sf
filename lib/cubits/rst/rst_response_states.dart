import 'package:equatable/equatable.dart';
import 'package:kiosk_sf/models/rst/rst_response.dart';

abstract class RstResponseStates extends Equatable {}

class rstInitialState extends RstResponseStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rstReadyState extends RstResponseStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rstLoadingState extends RstResponseStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class rstSaveSuccessState extends RstResponseStates {
  rstSaveSuccessState(this.rstResponse);
  final List<RstResponse> rstResponse;
  @override
  // TODO: implement props
  List<Object> get props => [rstResponse];
}

class rstDeleteSuccessState extends RstResponseStates {
  rstDeleteSuccessState(this.rstResponse);
  final List<RstResponse> rstResponse;
  @override
  // TODO: implement props
  List<Object> get props => [rstResponse];
}