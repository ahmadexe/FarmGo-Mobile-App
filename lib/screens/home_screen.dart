import 'package:farmgo/blocs/news%20bloc/bloc/news_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/screens/news_screen.dart';
import 'package:farmgo/widgets/your_location_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../static/constants.dart';
import '../utils/dummy_data.dart';
import '../widgets/field_card.dart';
import '../widgets/global_village_card.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: AppConstants.toolbarHeightDefault,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hey there!", style: app.text.h3),
                    Text("Ahmad", style: app.text.h1)
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  foregroundImage: AssetImage('assets/images/dp.jpeg'),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const YourLocationTile(),
                  SizedBox(height: app.space.y2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fields Around you", style: app.text.h2),
                      Row(
                        children: [
                          Text("Explore ", style: app.text.t2),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: app.space.y4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: app.space.x2,
                      children: List.generate(
                        3,
                        (index) => FieldCard(field: DummyData.fields[index]),
                      ),
                    ),
                  ),
                  SizedBox(height: app.space.y2),
                  Text("Global Village", style: app.text.h2),
                  SizedBox(height: app.space.y4),
                  const GlobalVillageCard(),
                  SizedBox(height: app.space.y2),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("News", style: app.text.h2),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const NewsScreen()));
                                  },
                                  child: Text("See More ", style: app.text.t2)),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: app.space.y4),
                      BlocBuilder<NewsBloc, NewsState>(
                        builder: (context, newsState) {
                          if (newsState is NewsFetchLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (newsState is NewsFetchSuccess) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return NewsCard(
                                    article: newsState.data![index]);
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
