import 'package:flutter/material.dart';
import 'package:kiosk_sf/route/route.dart' as route;

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF303f9f),
        body: SafeArea(
          child: Center(
            child: _loginForm(),
          ),
        ),
      );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: const Image(
                image: AssetImage('images/robot_arms_260x208.jpg'),
              ),
            ),
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
            const SizedBox(
              height: 50,
              width: 120,
              child: LoginButton(),
            ),
          ],
        ),
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
      validator: (value) => null,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, route.dashBoard),
    );
  }
}

// class LoginForm extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15.0),
//             child: Image(
//               image: AssetImage('images/robot_arms_260x208.jpg'),
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           _loginLabel(),
//           SizedBox(
//             height: 20.0,
//             width: 150.0,
//           ),
//           SizedBox(
//             width: 300.0,
//             child: _usernameField(),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           //password
//           SizedBox(
//             width: 300.0,
//             child: _passwordField(),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           SizedBox(
//             height: 50,
//             width: 120,
//             child: ElevatedButton(
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () => Navigator.pushNamed(context, route.dashBoard),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _loginLabel() {
//     return Text(
//       'iUp MES Login',
//       style: TextStyle(
//         fontSize: 40.0,
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//
//
//
//   Widget _passwordField() {
//     return TextField(
//       obscureText: true,
//       enableSuggestions: false,
//       autocorrect: false,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         fillColor: Color(0xFFC5CAE9),
//         filled: true,
//         prefixIcon: Icon(Icons.vpn_key),
//         hintText: 'Password',
//       ),
//     );
//   }
//
// }