import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_news/model/news/news.dart';
import 'package:weather_news/model/weather/current_weather.dart';

part 'restclient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("weather")
  Future<CurrentWeather> getCurrentWeather(
      @Queries() Map<String, dynamic> queries);
  @GET("top-headlines")
  Future<News> getHeadlineNews(@Queries() Map<String, dynamic> queries);
}
