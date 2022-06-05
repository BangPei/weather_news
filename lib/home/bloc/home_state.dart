part of 'home_bloc.dart';

class HomeState extends Equatable {
  final CurrentWeather? currentWeather;
  final News? news;
  final bool isLoading;

  const HomeState({
    this.currentWeather,
    this.news,
    this.isLoading = false,
  });

  HomeState copyWith({
    currentWeather,
    isLoading,
    news,
  }) {
    return HomeState(
      currentWeather: currentWeather ?? this.currentWeather,
      news: news ?? this.news,
      isLoading: isLoading ?? this.isLoading ?? false,
    );
  }

  @override
  List<Object?> get props => [
        currentWeather,
        isLoading,
        news,
      ];
}
