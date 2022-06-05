import 'package:weather_news/model/news/news.dart';
import 'package:weather_news/model/weather/current_weather.dart';
import 'package:weather_news/services/api.dart';

class HomeApi {
  static Future<CurrentWeather> getCurrentWeather(
      double lat, double lon) async {
    final client = await Api.restClient(Api.weatherURL);
    Map<String, dynamic> queries = {
      "appid": Api.weatherKey,
      "lat": lat,
      "lon": lon
    };
    var data = client.getCurrentWeather(queries);
    return data;
  }

  static Future<News> getHeadlineNews() async {
    final client = await Api.restClient(Api.newsURL);
    Map<String, dynamic> queries = {
      "apiKey": Api.newsKey,
      "country": "id",
    };
    var data = client.getHeadlineNews(queries);
    return data;
  }
}
