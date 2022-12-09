import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user bloc/bloc/user_bloc.dart';
import '../blocs/user bloc/bloc/user_state.dart';
import '../widgets/home_screen_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}, child:Icon(Icons.search), backgroundColor: gotoTextColorDark,),
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            children: [
              Text("Welcome ", style: app.text.h2),
              // Text(state.data!.userName, style: app.text.h2b),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send, color: Colors.white)),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Utilities", style: app.text.h2),
                SizedBox(height: app.space.y3),
                HomeScreenCard(
                    image: 'maps.jpg',
                    title: 'Fields',
                    subTitle: "View 3D models of fields near you",
                    onPressed: () {}),
                SizedBox(height: app.space.y4),
                HomeScreenCard(
                    image: 'newspapers.jpg',
                    title: 'News',
                    subTitle: "Read what's going on in agriculture world",
                    onPressed: () {}),
                SizedBox(height: app.space.y4),
                HomeScreenCard(
                    image: 'plants.jpg',
                    title: 'Find Diseases',
                    subTitle: 'Identify Diseases of your plants',
                    onPressed: () {}),

                SizedBox(height: app.space.y3),
                Text("Channels", style: app.text.h2),
                


              
              
              ],
            ),
          ),
        ),
      );
    });
  }
}
