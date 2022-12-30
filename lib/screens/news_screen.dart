import 'package:farmgo/blocs/news%20bloc/bloc/news_bloc.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/article.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Article>? news = BlocProvider.of<NewsBloc>(context).state.data;
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recent News", style: app.text.h2),
              SizedBox(height: app.space.y3),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: news!.length,
                itemBuilder: (context, index) {
                  return NewsCard(isMain: true, article: news[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: app.space.y3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
