import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_news/home/bloc/home_bloc.dart';
import 'package:weather_news/home/news_screen.dart';
import 'package:weather_news/home/weather_screen.dart';
import 'package:weather_news/login/bloc/login_bloc.dart';
import 'package:weather_news/widgets/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetCurrentWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              position: PopupMenuPosition.under,
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(
                    value: "Logout",
                    child: ListTile(
                      title: const Text("Logout"),
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      onTap: () {
                        context.read<LoginBloc>().add(LogoutSubmitted());
                      },
                    ),
                  ),
                ];
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.sunny),
                    Text("Weather"),
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.newspaper),
                    Text("Feed News"),
                  ],
                ),
              ),
            ],
          ),
          title: const Text('Weather & Feed News'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.isLoading
                ? LoadingScreen()
                : TabBarView(
                    children: [
                      WeatherScreen(),
                      NewsScreen(),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
