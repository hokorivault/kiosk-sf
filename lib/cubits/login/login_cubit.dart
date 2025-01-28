import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/models/user.dart';

import '../login/login_cubit_states.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit() : super(InitialState()){
    emit(WelcomeState());
  }

}