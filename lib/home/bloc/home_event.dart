part of 'home_bloc.dart';

abstract class HomeEvent {
  HomeEvent();
}

class GetCurrentWeather extends HomeEvent {
  GetCurrentWeather();
}
