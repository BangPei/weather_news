import 'package:dio/dio.dart';
import 'package:weather_news/helpers/interceptor/dio_interceptors.dart';
import 'package:weather_news/services/restclient.dart';

class Api {
  static String weatherURL = "https://api.openweathermap.org/data/2.5/";
  static String weatherKey = "e6cd8e28a239240e03bbd93a103be7d0";
  static String newsKey = "296547fa236247b58db00356ff3d664b";
  static String newsURL = "https://newsapi.org/v2/";

  static String notFoundImage =
      "https://infonesia.id/wp-content/uploads/2021/09/404-not-found.jpg";

  static restClient(String baseUrl) async {
    final dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(DioInterceptors(dio));
    return RestClient(dio, baseUrl: baseUrl);
  }
}
