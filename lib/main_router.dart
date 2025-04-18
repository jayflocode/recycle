import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/App%20info%20pages/aluminum.dart';
import 'package:recycle/App%20info%20pages/batteries.dart';
import 'package:recycle/App%20info%20pages/electronics.dart';
import 'package:recycle/App%20info%20pages/food.dart';
import 'package:recycle/App%20info%20pages/glass.dart';
import 'package:recycle/App%20info%20pages/hazardous.dart';
import 'package:recycle/App%20info%20pages/help.dart';
import 'package:recycle/App%20info%20pages/invalid.dart';
import 'package:recycle/App%20info%20pages/lawn.dart';
import 'package:recycle/main_history.dart';
import 'package:recycle/main_nav.dart';
import 'package:recycle/main_p_routes.dart';
import 'package:recycle/App%20info%20pages/metal.dart';
import 'package:recycle/App%20info%20pages/miscellaneous.dart';
import 'package:recycle/App%20info%20pages/not_found.dart';
import 'package:recycle/App%20info%20pages/oil.dart';
import 'package:recycle/App%20info%20pages/paper.dart';
import 'package:recycle/App%20info%20pages/plastic.dart';
import 'package:recycle/main_scan.dart';
import 'package:recycle/main_splash_page.dart';
import 'package:recycle/App%20info%20pages/tires.dart';

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
        return const SplashPage(title: 'Splash Page');
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
                  builder:
                      (context, state) =>
                          const PlasticPage(title: 'Plastic Page'),
                ),
                GoRoute(
                  path: Routes.aluminum,
                  builder:
                      (context, state) =>
                          const AluminumPage(title: 'Aluminum Page'),
                ),
                GoRoute(
                  path: Routes.battery,
                  builder:
                      (context, state) =>
                          const BatteryPage(title: 'Plastic Page'),
                ),
                GoRoute(
                  path: Routes.electronics,
                  builder:
                      (context, state) =>
                          const Electronics(title: 'Electronics Page'),
                ),
                GoRoute(
                  path: Routes.food,
                  builder: (context, state) => const Food(title: 'Food Page'),
                ),
                GoRoute(
                  path: Routes.glass,
                  builder: (context, state) => const Glass(title: 'Glass Page'),
                ),
                GoRoute(
                  path: Routes.hazard,
                  builder:
                      (context, state) =>
                          const Hazardous(title: 'Hazardous Page'),
                ),
                GoRoute(
                  path: Routes.invalid,
                  builder:
                      (context, state) => const Invalid(title: 'Invalid Page'),
                ),
                GoRoute(
                  path: Routes.lawn,
                  builder:
                      (context, state) => const LawnPage(title: 'Lawn Page'),
                ),
                GoRoute(
                  path: Routes.metal,
                  builder:
                      (context, state) => const MetalPage(title: 'Metal Page'),
                ),
                GoRoute(
                  path: Routes.miscellaneous,
                  builder:
                      (context, state) =>
                          const MiscellaneousPage(title: 'Miscellaneous Page'),
                ),
                GoRoute(
                  path: Routes.notFound,
                  builder:
                      (context, state) =>
                          const NotFound(title: 'Not Found Page'),
                ),
                GoRoute(
                  path: Routes.oil,
                  builder: (context, state) => const OilPage(title: 'Oil Page'),
                ),
                GoRoute(
                  path: Routes.paper,
                  builder:
                      (context, state) => const PaperPage(title: 'Paper Page'),
                ),
                GoRoute(
                  path: Routes.tires,
                  builder:
                      (context, state) => const TiresPage(title: 'Tires Page'),
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
              builder: (context, state) => const Help(title: 'Help Page'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            // Help page navigation Area
            GoRoute(
              // help page root
              path: Routes.history,
              builder: (context, state) => HistoryPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
