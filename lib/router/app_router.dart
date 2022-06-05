import 'package:fluro/fluro.dart';

class AppRouter {
  static FluroRouter router = FluroRouter.appRouter;

  final List<AppRoute> _routes;
  final Handler _notFoundHandler;

  List<AppRoute> get routes => _routes;

  const AppRouter({
    required List<AppRoute> routes,
    required Handler notFoundHandler,
  })  : _routes = routes,
        _notFoundHandler = notFoundHandler;

  void setupRoutes() {
    router.notFoundHandler = _notFoundHandler;
    for (var route in routes) {
      router.define(
        route.route,
        handler: route.handler,
        transitionType: TransitionType.none,
      );
    }
  }
}
