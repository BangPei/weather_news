import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_news/helpers/interceptor/injector.dart';
import 'package:weather_news/helpers/interceptor/navigation_service.dart';
import 'package:weather_news/home/bloc/home_bloc.dart';
import 'package:weather_news/login/bloc/login_bloc.dart';
import 'package:weather_news/register/bloc/register_bloc.dart';
import 'package:weather_news/router/app_router.dart';
import 'package:weather_news/router/app_routers.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NavigationService _nav = locator<NavigationService>();

  @override
  void initState() {
    AppRouter appRouter = AppRouter(
      routes: AppRoutes.routes,
      notFoundHandler: AppRoutes.routeNotFoundHandler,
    );
    appRouter.setupRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (__) => LoginBloc()),
        BlocProvider<RegisterBloc>(create: (__) => RegisterBloc()),
        BlocProvider<HomeBloc>(create: (__) => HomeBloc()),
      ],
      child: MaterialApp(
        navigatorKey: _nav.navigatorKey,
        theme: ThemeData(
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.router.generator,
      ),
    );
  }
}
