import 'package:farmgo/configs/custom_colors.dart';
import 'package:farmgo/cubits/switch/switch_cubit.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        elevation: 0.0,
      ),
      body: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          AppProvider app = AppProvider.state(context);
          return Center(
              child: Column(
            children: [
              Container(
                height: 50,
                width: 70,
                color: customPrimaryColorLight,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Ads")),
              SizedBox(height: 30),
              Text(
                "HEllo",
                style: app.text.h1
              )
            ],
          ));
        },
      ),
    );
  }
}
