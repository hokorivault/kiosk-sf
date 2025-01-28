import 'package:flutter/material.dart';
import 'package:kiosk_sf/views/dashboard.dart';
import 'package:kiosk_sf/views/eighty_ten_idea.dart';
import 'package:kiosk_sf/views/eighty_seventy.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  Widget buildListTile({
    required String text,
    required IconData icon,
    VoidCallback? onClicked
  }) {
    const whiteColor = Colors.white;
    const iconColor = Color(0xFF536dfe);
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: whiteColor),
      title: Text(text, style: const TextStyle(color: whiteColor, fontSize: 20.0)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EightyTenIdea(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EightySeventy(),
        ));
        break;
      case 8:
        print('Logout');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String accountName = 'jpim';
    String accountEmail = 'jpim@test.com';

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(48, 63, 159, 1),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                accountName,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              accountEmail: Text(
                accountEmail,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              currentAccountPicture: ClipOval(
                child: Image.asset('images/429x417_worker.jpg'),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/200/300'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildListTile(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            buildListTile(
              text: '입고 등록 (8010F)',
              icon: Icons.pageview,
              onClicked: () => selectedItem(context, 1),
            ),
            buildListTile(
              text: '원재료투입 등록 (8020F)',
              icon: Icons.assignment,
            ),
            buildListTile(
              text: '생산/포장 실적 등록 (8040F)',
              icon: Icons.assessment,
            ),
            buildListTile(
              text: '출고검수 등록 (8050F)',
              icon: Icons.view_comfy,
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_input_component,
                color: Color(0xFF536dfe),
              ),
              title: const Text(
                '생산작업 가동 (8060F)',
                style: TextStyle(
                  color: Color(0xFFffffff),
                  fontSize: 20.0,
                ),
              ),
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: const Center(
                    child: Text('3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )
                    ),
                  ),
                ),
              ),
            ),
            buildListTile(
              text: '생산실적 등록 (8070F)',
              icon: Icons.chrome_reader_mode,
              onClicked: () => selectedItem(context, 6),
            ),
            buildListTile(
              text: '포장실적 등록 (8080F)',
              icon: Icons.description,
            ),
            const Divider(
              color: Color(0xffC5CAE9),
            ),
            buildListTile(
              text: 'Logout',
              icon: Icons.exit_to_app,
              onClicked: () => selectedItem(context, 8),
            ),
            const Divider(
              color: Color(0xffC5CAE9),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 85, horizontal: 10),
                child: Text('Version v0.0.4',
                  style: TextStyle(
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

