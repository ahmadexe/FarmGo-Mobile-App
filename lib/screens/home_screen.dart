import 'package:farmgo/blocs/news%20bloc/bloc/news_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/screens/all_fields_screen.dart';
import 'package:farmgo/screens/my_fields_screen.dart';
import 'package:farmgo/screens/news_screen.dart';
import 'package:farmgo/widgets/your_location_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../static/constants.dart';
import '../utils/dummy_data.dart';
import '../widgets/field_card.dart';
import '../widgets/global_village_card.dart';
import '../widgets/news_card.dart';
import 'maps_screen.dart';

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

  final dropdownItems = [
    'Global',
    'Channel 1',
    'Channel 2',
    'Channel 3',
    'Channel 4',
    'Channel 5'
  ];

  String? value = "Global";

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            drawer: Drawer(
              backgroundColor: fieldContrastDark,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    SizedBox(height: app.space.y1),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          foregroundImage: AssetImage('assets/images/dp.jpeg'),
                        ),
                        SizedBox(width: app.space.x2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello! 👋",
                                style:
                                    app.text.t1.copyWith(color: textColorGrey)),
                            Text("Ahmad", style: app.text.h1),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: app.space.y3),
                    const Divider(),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {},
                      leading: const Icon(
                        CupertinoIcons.leaf_arrow_circlepath,
                        color: Colors.white,
                      ),
                      title: const Text("My Plants"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => MyFieldsScreen()));
                      },
                      leading: const Icon(
                        CupertinoIcons.map_fill,
                        color: Colors.white,
                      ),
                      title: const Text("My Fields"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AllFieldsScreen())
                        );
                      },
                      leading: const Icon(
                        CupertinoIcons.cloud_moon_fill,
                        color: Colors.white,
                      ),
                      title: const Text("View Fields"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {},
                      leading: const Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white,
                      ),
                      title: const Text("Find Investors"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {},
                      leading: const Icon(
                        Icons.workspaces_outline,
                        color: Colors.white,
                      ),
                      title: const Text("Find Farmers"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {},
                      leading: const Icon(
                        Icons.question_answer_outlined,
                        color: Colors.white,
                      ),
                      title: const Text("Answer my Questions"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => MapsScreen()),
                        );
                      },
                      leading: const Icon(
                        CupertinoIcons.map_pin,
                        color: Colors.white,
                      ),
                      title: const Text("Maps"),
                    ),
                    SizedBox(
                      height: app.space.y4,
                    ),
                    ListTile(
                      tileColor: fieldContrastDark,
                      onTap: () async {
                        BlocProvider.of<UserBloc>(context).add(UserLogout());
                      },
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: const Text("Log out?"),
                    ),
                    SizedBox(height: app.space.y3),
                    const Divider(),
                    SizedBox(height: app.space.y3),
                    DropdownButton<String>(
                        underline: null,
                        dropdownColor: fieldContrastDark,
                        iconSize: 20,
                        isExpanded: true,
                        value: value,
                        items: dropdownItems.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          setState(() {
                            this.value = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              toolbarHeight: AppConstants.toolbarHeighty1,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Hey there!"),
                  CircleAvatar(
                    radius: 20,
                    foregroundImage: AssetImage('assets/images/dp.jpeg'),
                  ),
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
                          (index) => FieldCard(
                              onPressed: () {}, field: DummyData.fields[index]),
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
                                    child:
                                        Text("See More ", style: app.text.t2)),
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
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return NewsCard(
                                      article: newsState.data![index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: app.space.y4);
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
          ),
        );
      },
    );
  }
}
