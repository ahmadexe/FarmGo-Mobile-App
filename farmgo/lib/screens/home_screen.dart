import 'package:farmgo/constants/custom_colors.dart';
import 'package:farmgo/cubits/switch/switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        elevation: 0,
      ),
      body: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          return Center(
            child: Container(
              height: 50,
              width: 50,
              color: customPrimaryColorLight,
            )
          );
        },
      ),
    );
  }
}
