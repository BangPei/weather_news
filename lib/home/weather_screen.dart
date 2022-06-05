import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_news/home/bloc/home_bloc.dart';
import 'package:weather_news/model/weather/weather.dart';
import 'package:weather_news/theme.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double _kelvinToCelcius = 273.15;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Weather _weather = state.currentWeather?.weather?[0] ?? Weather();
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    state.currentWeather?.name ?? "City Name".toUpperCase(),
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _weather.description ?? "Description".toUpperCase(),
                    style: heading6,
                  ),
                  Padding(
                    child: Divider(
                      color: primaryBlue,
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          "http://openweathermap.org/img/w/${_weather.icon}.png",
                          scale: 1,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${((state.currentWeather?.main?.temp ?? 0) - _kelvinToCelcius).round()} \u2103",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 80,
                            color: Colors.black87,
                          ),
                        ),
                        Padding(
                          child: Divider(
                            color: primaryBlue,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Min"),
                                  Text(
                                    "${((state.currentWeather?.main?.tempMin ?? 0) - _kelvinToCelcius).round()} \u2103",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 20,
                                child: Center(
                                  child: Text("--"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Max"),
                                  Text(
                                    "${((state.currentWeather?.main?.tempMax ?? 0) - _kelvinToCelcius).round()} \u2103",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          child: Divider(
                            color: primaryBlue,
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
