import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/login/login_cubit.dart';
import 'package:kiosk_sf/cubits/login/login_cubit_states.dart';

class LoginCubitLogics extends StatefulWidget {
  const LoginCubitLogics({Key? key}) : super(key: key);

  @override
  _LoginCubitLogicsState createState() => _LoginCubitLogicsState();
}

class _LoginCubitLogicsState extends State<LoginCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginCubitStates>(
        builder: (context, state){
          if(state is WelcomeState) {
            return const Text('Welcome State');
          } else {
            return Text('Empty State');
          }
        },
      )
    );
  }
}
