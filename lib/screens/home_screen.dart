import 'package:farmgo/blocs/user%20bloc/bloc/user_bloc.dart';
import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/widgets/your_location_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../static/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
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
                  Text("Hey there!", style: app.text.h2),
                  Text("Ahmad", style: app.text.h1)
                ],
              ),
              const CircleAvatar(
                radius: 25,
                foregroundImage: AssetImage('assets/images/dp.jpeg'),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const YourLocationTile(),
              SizedBox(height: app.space.y2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fields Around you", style: app.text.h2),
                  Row(
                    children: [
                      Text("Explore ", style: app.text.t1sb),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
