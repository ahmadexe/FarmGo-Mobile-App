import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/models/user_model.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user bloc/bloc/user_bloc.dart';
import '../static/constants.dart';
import '../widgets/profile_tiles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    UserModel user = BlocProvider.of<UserBloc>(context).state.data!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        toolbarHeight: AppConstants.toolbarHeighty1,
        elevation: 0,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: app.space.y1),
            ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(app.radius.lightCurve)),
              child: SizedBox(
                height: 110,
                width: 120,
                child: Image.asset("assets/images/dp.jpeg", fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: app.space.y3),
            Text(
              user.userName,
              style: app.text.h2,
            ),
            Text(
              user.isInvestor ? "Investor" : "Farmer",
              style: app.text.t2.copyWith(color: textColorGrey),
            ),
            SizedBox(height: app.space.y1),
            const ProfileTiles(),
            SizedBox(height: app.space.y2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Role", style: app.text.t2.copyWith(color: textColorGrey)),
                SizedBox(height: app.space.y4),
                Text(user.isInvestor ? "Investor" : "Farmer",
                    style: app.text.t1),
                Divider(
                  color: textColorGrey,
                ),
                SizedBox(height: app.space.y2),
                Text("Full name",
                    style: app.text.t2.copyWith(color: textColorGrey)),
                SizedBox(height: app.space.y4),
                Text(user.name, style: app.text.t1),
                Divider(
                  color: textColorGrey,
                ),
                SizedBox(height: app.space.y2),
                Text("Email",
                    style: app.text.t2.copyWith(color: textColorGrey)),
                SizedBox(height: app.space.y4),
                Text(user.email, style: app.text.t1),
                Divider(
                  color: textColorGrey,
                ),
                SizedBox(height: app.space.y2),
                Text("Contact",
                    style: app.text.t2.copyWith(color: textColorGrey)),
                SizedBox(height: app.space.y4),
                Text(user.contact, style: app.text.t1),
                Divider(
                  color: textColorGrey,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
