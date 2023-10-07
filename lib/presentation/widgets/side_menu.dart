import 'package:app_widgets/config/menu/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex =0;
  @override
  Widget build(BuildContext context) {

    // Para determinar si el dispositivo tiene NOTCH (Parte superior - bocina)
    final hasNotch = MediaQuery.of(context).viewPadding.top>35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
          setState(() {
              navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];

          context.push(menuItem.link);

          widget.scaffoldKey.currentState?.closeDrawer(); 
      },
      children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10: 20, 16, 10),
            child: const Text("Menú principal")
          ),

          // aplicamos spread a lista de menu
          ...appMenuItems
              .sublist(0,3) // Extraemos 3 items
              .map((item) => NavigationDrawerDestination(
                icon: Icon(item.icon), 
                label: Text(item.title)
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Divider(),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text("Submenu")
          ),

          // aplicamos spread a lista de menu
          ...appMenuItems
              .sublist(3) // Extraemos 3 items
              .map((item) => NavigationDrawerDestination(
                icon: Icon(item.icon), 
                label: Text(item.title)
              )),
      ] 
    );
  }
}