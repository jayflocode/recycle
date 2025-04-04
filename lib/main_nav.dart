import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/main_p_dest.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: navigationShell,
    bottomNavigationBar: NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: navigationShell.goBranch,
      backgroundColor: Color.fromARGB(255, 204, 231, 213),
      indicatorColor: Theme.of(context).primaryColor,
      destinations:
          destinations
              .map(
                (destination) => NavigationDestination(
                  icon: Icon(destination.icon),
                  label: destination.label,
                  selectedIcon: Icon(destination.icon, color: Colors.white),
                ),
              )
              .toList(),
    ),
  );
}
