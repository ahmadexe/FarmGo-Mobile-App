import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather bloc/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(const FetchWeather(lat: 33.651592, long: 73.156456));
  }
  
  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppConstants.toolbarHeighty1,
        title: const Text("Weather"),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherResponseLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherResponseSuccess) {
            return const Center(
              child: Text("Weather loaded"),
            );
          } else {
            return const Center(
              child: Text("Some error occured"),
            );
          }
        }
      ),
    );
  }
}