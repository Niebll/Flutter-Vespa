import 'package:flutter/material.dart';
import 'package:vespa/UI/Catalogue/catalogueVespa.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:vespa/UI/IntroPage/loginPage.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/arcticons.dart';
import 'package:vespa/widget/cart_list.dart';


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
              icon: HeroiconsSolid.home,
              iconColor: Colors.white,
              size: 16,
              text: "Home",
              onClicked: () => SelectedItem(context, int, 0),
            ),
            Container(
              color: Color.fromRGBO(109, 203, 176, 1),
              child: ExpansionTile(
                leading: Iconify(Arcticons.bookcatalogue, color: Colors.white,),
                title: Text(
                  "Catalogue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                children: [
                  MenuItem(
                      text: "Vespa",
                      iconColor: Colors.white,
                      icon: Healthicons.vespa_motorcycle,
                      size: 14,
                      onClicked: () => SelectedItem(context, int, 1)),
                  MenuItem(text: "Accesories", icon: Mdi.racing_helmet, iconColor: Colors.white, size: 16)
                ],
              ),
            ),
            MenuItem(
              icon: Iconoir.small_shop_alt,
              iconColor: Colors.white,
              size: 16,
              text: "Cart",
              onClicked: () => SelectedItem(context, int, 2),
            ),
            MenuItem(
              icon: Iconoir.small_shop_alt,
              iconColor: Colors.white,
              size: 16,
              text: "Outlet",
            ),
          ],
        ),
      ),
    );
  }
}

Widget MenuItem(
    {required String text,
    required String icon,
      required Color iconColor,
    required double size,
    VoidCallback? onClicked}) {
  final color = Colors.black;
  final boxColor = Color.fromRGBO(109, 203, 176, 1);

  return ListTile(
    tileColor: boxColor,
    leading: Iconify(icon, color: iconColor,),
    title: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: size),
    ),
    onTap: onClicked,
  );
}

void SelectedItem(BuildContext context, int, index) {
  Navigator.pop(context);
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homepage()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CatalogueVespa()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CartList()));
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homepage()));
      break;
  }
}
