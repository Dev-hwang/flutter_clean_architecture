import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/ui/components/bottom_navigation_shell.dart';
import '../../features/auth/presentation/ui/login_page.dart';
import '../../features/chatting/presentation/ui/chatting_page.dart';
import '../../features/community/presentation/ui/community_page.dart';
import '../../features/home/presentation/ui/home_page.dart';
import '../../features/map/presentation/ui/map_page.dart';
import '../../features/user/presentation/ui/my_page.dart';
import 'router_observer.dart';

export 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();

abstract class AppRouter {
  static final GoRouter config = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.login,
    observers: [RouterObserver()],
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (_, __) => const LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return BottomNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (_, __) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.community,
                builder: (_, __) => const CommunityPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.map,
                builder: (_, __) => const MapPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.chatting,
                builder: (_, __) => const ChattingPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.my,
                builder: (_, __) => const MyPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

abstract class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String community = '/community';
  static const String map = '/map';
  static const String chatting = '/chatting';
  static const String my = '/my';
}
