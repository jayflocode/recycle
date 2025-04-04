import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/aluminum.dart';
import 'package:recycle/batteries.dart';
import 'package:recycle/electronics.dart';
import 'package:recycle/food.dart';
import 'package:recycle/glass.dart';
import 'package:recycle/hazardous.dart';
import 'package:recycle/help.dart';
import 'package:recycle/invalid.dart';
import 'package:recycle/lawn.dart';
import 'package:recycle/main_nav.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:recycle/metal.dart';
import 'package:recycle/miscellaneous.dart';
import 'package:recycle/not_found.dart';
import 'package:recycle/oil.dart';
import 'package:recycle/paper.dart';
import 'package:recycle/plastic.dart';
import 'package:recycle/main_scan.dart';
import 'package:recycle/main_splash_page.dart';
import 'package:recycle/tires.dart';

// navigator key for nested browsing
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.start,
  // Routes at Root Level
  routes: [
    GoRoute(
      //route for start page
      path: Routes.start,
      builder: (BuildContext context, GoRouterState state) {
        return const StartPage();
      },
    ),
    // Stateful Shell Route for Navigation bar
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              LayoutScaffold(navigationShell: navigationShell),
      branches: [
        //main branches for Scan Routing
        StatefulShellBranch(
          routes: [
            // scan page navigation area
            GoRoute(
              //scan page Root
              path: Routes.scan,
              builder: (context, state) => const ScanPage(),
              routes: [
                //
                GoRoute(
                  path: Routes.plastic,
                  builder: (context, state) => const Plastic(),
                ),
                GoRoute(
                  path: Routes.aluminum,
                  builder: (context, state) => const Aluminum(),
                ),
                GoRoute(
                  path: Routes.battery,
                  builder: (context, state) => const Battery(),
                ),
                GoRoute(
                  path: Routes.electronics,
                  builder: (context, state) => const Electronics(),
                ),
                GoRoute(
                  path: Routes.food,
                  builder: (context, state) => const Food(),
                ),
                GoRoute(
                  path: Routes.glass,
                  builder: (context, state) => const Glass(),
                ),
                GoRoute(
                  path: Routes.hazard,
                  builder: (context, state) => const Hazardous(),
                ),
                GoRoute(
                  path: Routes.invalid,
                  builder: (context, state) => const Invalid(),
                ),
                GoRoute(
                  path: Routes.lawn,
                  builder: (context, state) => const Lawn(),
                ),
                GoRoute(
                  path: Routes.metal,
                  builder: (context, state) => const Metal(),
                ),
                GoRoute(
                  path: Routes.miscellaneous,
                  builder: (context, state) => const Miscellaneous(),
                ),
                GoRoute(
                  path: Routes.notFound,
                  builder: (context, state) => const NotFound(),
                ),
                GoRoute(
                  path: Routes.oil,
                  builder: (context, state) => const Oil(),
                ),
                GoRoute(
                  path: Routes.paper,
                  builder: (context, state) => const Paper(),
                ),
                GoRoute(
                  path: Routes.tires,
                  builder: (context, state) => const Tires(),
                ),
              ],
            ),
          ],
        ),
        // main branch for Help Menu
        StatefulShellBranch(
          routes: [
            // Help page navigation Area
            GoRoute(
              // help page root
              path: Routes.help,
              builder: (context, state) => const Help(),
            ),
          ],
        ),
      ],
    ),
  ],
);
