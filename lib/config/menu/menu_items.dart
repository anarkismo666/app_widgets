import 'package:flutter/material.dart';

class MenuItem{
    final String title;
    final String subtitle;
    final String link;
    final IconData icon;

   const MenuItem({required this.title, required this.subtitle, required this.link, required this.icon});
}

const appMenuItems = <MenuItem> [
      MenuItem(title: 'Botones', subtitle: 'Varios botones', link: '/buttons', icon: Icons.ac_unit),
      MenuItem(title: 'Tarjetas', subtitle: 'Contenedor estilizado', link: '/cards', icon: Icons.card_giftcard),
      MenuItem(title: 'ProgressIndicaror', subtitle: 'Generales y controlado', link: '/progress', icon: Icons.refresh_outlined),
      MenuItem(title: 'Snackbar/Dialogs', subtitle: 'SnackBar', link: '/snackbars', icon: Icons.snapchat),
      MenuItem(title: 'Animation Container', subtitle: 'Contenedor animado', link: '/animated', icon: Icons.run_circle),
      MenuItem(title: 'UI Controls', subtitle: 'Controles varios', link: '/ui-controls', icon: Icons.control_point),
      MenuItem(title: 'App tutorial', subtitle: 'Tutorial de la app', link: '/tutorial', icon: Icons.tune_outlined),
      MenuItem(title: 'InfiniteScroll y pull', subtitle: 'Infinite Scrol test', link: '/infinite', icon: Icons.crisis_alert_outlined),
      MenuItem(title: 'Counter Riverpod', subtitle: 'Inte', link: '/counter-riverpod', icon: Icons.add_call),
      MenuItem(title: 'Theme changer', subtitle: 'Theme', link: '/theme-changer', icon: Icons.color_lens_outlined),


];