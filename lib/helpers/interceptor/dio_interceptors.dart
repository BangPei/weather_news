import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_news/helpers/common.dart';
import 'package:weather_news/router/app_router.dart';
import 'package:weather_news/router/app_routers.dart';

import 'injector.dart';
import 'navigation_service.dart';

class DioInterceptors extends InterceptorsWrapper {
  final Dio dio;
  DioInterceptors(this.dio);
  final NavigationService _nav = locator<NavigationService>();

  @override
  Future onError(err, handler) async {
    int? responseCode = err.response?.statusCode;
    if (responseCode != null) {
      if (responseCode == 403) {
        AppRouter.router.navigateTo(
          _nav.navigatorKey.currentContext!,
          AppRoutes.loginRoute.route,
          replace: true,
          clearStack: true,
        );
      } else {
        Common.modalInfo(
          _nav.navigatorKey.currentContext!,
          title: "Error",
          message: err.response?.data['message'] ?? "Gagal Mengakses Server",
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    } else {
      Common.modalInfo(
        _nav.navigatorKey.currentContext!,
        title: "Error",
        message: err.response?.data['message'] ?? "Gagal Mengakses Server",
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
    super.onError(err, handler);
  }
}
