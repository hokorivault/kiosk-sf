import 'package:flutter/material.dart';
import 'package:kiosk_sf/route/route.dart' as route;

import 'package:kiosk_sf/services/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/login/login_cubit.dart';

class LoginMes extends StatefulWidget {
  const LoginMes({Key? key}) : super(key: key);


  @override
  _LoginMesState createState() => _LoginMesState();
}

class _LoginMesState extends State<LoginMes> {

  // late LoginBloc _loginBloc;
  //
  // @override
  // void initState() {
  //   _loginBloc = LoginBloc();
  //
  //   if (_loginBloc.settingPref == null) {
  //     Future<SharedPreferences?> res = _loginBloc.sharedPrefInit();
  //     res.then((value) {
  //       _loginBloc.settingPref = value;
  //       _loginBloc.loadSaveInfo();
  //       setState(() {});
  //     });
  //   }
  //
  //   super.initState();
  //   SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // }
  //
  // List<String> langItems = ['ENG', 'KOR'];

  final _dataService = DataService();
  late int _response;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303f9f),
      body: SafeArea(
        child: Center(
          child: BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
              child: _loginForm()
          ),
        ),
      ),
    );
  }

  void _mesLogin(String user, String pass) async {
    final response = await _dataService.mesLogin(user, pass);
    if (response == 1) {
      Navigator.pushNamed(context, route.dashBoard);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_dataService.loginMSG),
      ));
    }
  }

  Widget _loginForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _logo(),
          const SizedBox(
            height: 20.0,
          ),
          _loginLabel(),
          const SizedBox(
            height: 20.0,
            width: 150.0,
          ),
          SizedBox(
            width: 300.0,
            child: _usernameField(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //password
          SizedBox(
            width: 300.0,
            child: _passwordField(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 50,
            width: 120,
            child: _loginButton(),
          ),
        ],
      ),
    );
  }

  Widget _logo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: const Image(
        image: AssetImage('images/robot_arms_260x208.jpg'),
      ),
    );
  }

  Widget _loginLabel() {
    return const Text(
      'iUp MES Login',
      style: TextStyle(
        fontSize: 40.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          fillColor: Color(0xFFC5CAE9),
          filled: true,
          prefixIcon: Icon(Icons.account_box),
          hintText: 'Username'
      ),
      //controller: _loginBloc.usrnmCntrl,
      controller: usernameController,
      validator: (value) => null,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Color(0xFFC5CAE9),
        filled: true,
        prefixIcon: Icon(Icons.vpn_key),
        hintText: 'Password',
      ),
      controller: passwordController,
      //controller: _loginBloc.pwdCntrl,
      validator: (value) => null,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // onPressed: () => Navigator.pushNamed(context, route.dashBoard),
        onPressed: () {
          // _loginBloc.login().then((value) {
          //   if (value == 1) {
          //     _loginBloc.saveSettings();
          //     Navigator.pushNamed(context, route.dashBoard);
          //   } else {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text(_loginBloc.loginMSG),
          //     ));
          //     //_loginDialog(_loginBloc.loginMSG);
          //   }
          // });
          _mesLogin(usernameController.text, passwordController.text);
        }
    );
  }

  // void _loginDialog(String msg) {
  //   Widget closeBtn = TextButton.icon(
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       icon: Icon(Icons.close_rounded),
  //       label: Text("Close"));
  //
  //   AlertDialog dialog = AlertDialog(
  //     title: Text("Login"),
  //     content: Text(msg),
  //     actions: [closeBtn],
  //   );
  //
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => dialog,
  //       barrierDismissible: false);
  // }
}

// class LoginButton extends StatelessWidget {
//   const LoginButton({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: const Text(
//         'Login',
//         style: TextStyle(
//           fontSize: 22.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onPressed: () => Navigator.pushNamed(context, route.dashBoard),
//     );
//   }
// }
