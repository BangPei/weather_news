import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_news/home/home_api.dart';
import 'package:weather_news/model/news/news.dart';
import 'package:weather_news/model/weather/current_weather.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetCurrentWeather) {
        emit(HomeState(isLoading: true));
        HomeState homeState = await _getCurrentWeather(event, state);
        emit(homeState);
      }
    });
  }

  Future<HomeState> _getCurrentWeather(
      GetCurrentWeather event, HomeState state) async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      permission = await Geolocator.checkPermission();
      print(permission);
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      CurrentWeather _currentWeather = await HomeApi.getCurrentWeather(
          position.latitude, position.longitude);
      News _news = await HomeApi.getHeadlineNews();

      return state.copyWith(
        currentWeather: _currentWeather,
        news: _news,
        isLoading: false,
      );
    } catch (e) {
      return state.copyWith(isLoading: false);
    }
  }
}
