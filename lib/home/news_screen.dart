import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_news/home/bloc/home_bloc.dart';
import 'package:weather_news/model/news/article.dart';
import 'package:weather_news/services/api.dart';
import 'package:weather_news/theme.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.news?.articles?.length ?? 0,
            itemBuilder: (context, i) {
              Article _articles = state.news?.articles?[i] ?? Article();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Card(
                  shadowColor: textGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          _articles.title ?? "Title",
                          style: heading5,
                        ),
                        SizedBox(height: 10),
                        Image.network(
                            _articles.urlToImage ?? Api.notFoundImage),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
