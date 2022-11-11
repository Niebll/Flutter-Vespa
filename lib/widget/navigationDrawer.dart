import 'package:flutter/material.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:vespa/UI/IntroPage/loginPage.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            MenuItem(
              icon: Icons.home_outlined,
              size: 20,
              text: "Home",
              onClicked: () => 0,
            ),
            ExpansionTile(
             leading: Icon(Icons.card_travel),
              title: Text("Catalogue"),children: [
                MenuItem(text: "Vespa", icon: Icons.electric_scooter_sharp, size: 20,
                  onClicked: () => SelectedItem(context, int, 1)
                ),
              MenuItem(text: "Accesories", icon: Icons.headphones, size: 20)
            ],
            ),
            MenuItem(
              icon: Icons.cell_tower,
              size: 20,
              text: "Outlet",
            ),
          ],
        ),
      ),
    );
  }
}

Widget MenuItem(
    {required String text, required IconData icon, required double size, VoidCallback? onClicked}) {
  final color = Colors.black;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    ),
    onTap: onClicked,
  );
}

  void SelectedItem(BuildContext context, int, index){
  Navigator.pop(context);
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homepage()));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Loginpage()));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homepage()));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homepage()));
      break;
  }
  }

