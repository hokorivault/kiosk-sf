import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/route/route.dart' as route;
import 'package:kiosk_sf/navbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildCommonBtn({
      required String text,
      VoidCallback? onTap
    }) {
      return SizedBox(
        height: 80,
        width: 220,
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff607D8B),
          ),
          onPressed: onTap,
        ),
      );
    }

    void selectedItem(BuildContext context, int index) {
      switch (index) {
        case 1:
          print('Index is: $index');
          Navigator.pushNamed(context, route.eightyTenIdea);
          break;
        case 2:
          print('Index is: $index');
          Navigator.pushNamed(context, route.eightySeventy);
          break;
        default:
          throw('The route does not exist yet.');
      }
    }

    Widget _dashboardContent() {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                // 8010
                buildCommonBtn(
                    text: '입고 등록',
                    onTap: () => selectedItem(context, 1)
                ),
              ],
            ),
            const SizedBox(
              width: 25.0,
            ),
            Column(
              children: [
                // 8070
                buildCommonBtn(
                    text: '생산실적 등록',
                    onTap: () => selectedItem(context, 2)
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // 8080
                buildCommonBtn(
                    text: '포장실적 등록',
                    onTap: () => selectedItem(context, 3)
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // 8060
                buildCommonBtn(
                    text: '생산작업 가동',
                    onTap: () => selectedItem(context, 3)
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // 8040
                buildCommonBtn(
                    text: '생산/포장 실적 등록',
                    onTap: () => selectedItem(context, 3)
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // 8020
                buildCommonBtn(
                    text: '원재료투입 등록',
                    onTap: () => selectedItem(context, 3)
                ),
              ],
            ),
            const SizedBox(
              width: 25.0,
            ),
            Column(
              children: [
                buildCommonBtn(
                    text: '출고검수 등록',
                    onTap: () => selectedItem(context, 3)
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF303f9f),
      appBar: AppBar(
        title: const Text('Kiosk SmartFactory'),
      ),
      drawer: const NavBar(),
      body: _dashboardContent(),
    );
  }
}