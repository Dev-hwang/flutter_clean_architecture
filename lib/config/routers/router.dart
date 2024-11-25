import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/ui/login_page.dart';
import '../../features/home/presentation/ui/home_page.dart';
import 'router_observer.dart';

export 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter config = GoRouter(
    initialLocation: Routes.home,
    observers: [RouterObserver()],
    routes: [
      GoRoute(path: Routes.login, builder: (_, __) => const LoginPage()),
      GoRoute(path: Routes.home, builder: (_, __) => const HomePage()),
    ],
  );
}

abstract class Routes {
  static const String login = '/login';
  static const String home = '/home';
}
