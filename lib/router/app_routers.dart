// import 'package:fl_pintpoint/screen/splash/screen/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:weather_news/home/home_screen.dart';
import 'package:weather_news/login/login_screen.dart';
import 'package:weather_news/register/register_screen.dart';
import 'package:weather_news/splash/splash_screen.dart';
import 'package:weather_news/widgets/not_found.dart';

class AppRoutes {
  static final routeNotFoundHandler =
      Handler(handlerFunc: (context, params) => const RouteNotFoundPage());

  static final splashRoute = AppRoute(
    '/',
    Handler(
      handlerFunc: (context, parameters) => const SplashScreen(),
    ),
    transitionDuration: const Duration(seconds: 10),
  );

  static final loginRoute = AppRoute(
    '/login',
    Handler(
      handlerFunc: (context, parameters) => LoginScreen(),
    ),
  );
  static final registerRoute = AppRoute(
    '/register',
    Handler(
      handlerFunc: (context, parameters) => RegisterScreen(),
    ),
  );

  static final homeRoute = AppRoute(
    '/home',
    Handler(
      handlerFunc: (context, parameters) => const HomeScreen(),
    ),
  );

  // static final addressByIndex = AppRoute(
  //   '/customer/:id/:index',
  //   Handler(
  //     handlerFunc: (context, Map<String, List<String>> params) {
  //       final String id = params["id"]![0];
  //       final int index = int.parse(params["index"]![0]);
  //       return CustomerScreen(
  //         id: id,
  //         index: index,
  //       );
  //     },
  //   ),
  // );
  // static final customerById = AppRoute(
  //   '/customer/:id',
  //   Handler(
  //     handlerFunc: (context, Map<String, List<String>> params) {
  //       final String id = params["id"]![0];
  //       return CustomerForm(
  //         id: id,
  //       );
  //     },
  //   ),
  // );

  /// Primitive function to get one param detail route (i.e. id).
  static String getDetailRoute(String parentRoute, String id) {
    return "$parentRoute/$id";
  }

  static final List<AppRoute> routes = [
    homeRoute,
    loginRoute,
    splashRoute,
  ];
}
