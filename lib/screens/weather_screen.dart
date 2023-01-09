import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/static/constants.dart';
import 'package:farmgo/utils/weather_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/weather bloc/bloc/weather_bloc.dart';
import '../widgets/line_chart_custom.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context)
        .add(const FetchWeather(lat: 33.651592, long: 73.156456));
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
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherResponseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherResponseSuccess) {
          print(state.data.toString());
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: app.space.y3),
                  Text(state.data!.name!, style: app.text.h1sb),
                  SizedBox(height: app.space.y2),
                  SizedBox(
                    height: 100.h,
                    width: 100.h,
                    child: Image.network(state.data!.weather![0].iconUrl,
                        fit: BoxFit.fill),
                  ),
                  SizedBox(height: app.space.y2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "${WeatherUtils.kelvinToCelcius(state.data!.main!.temp!)}° C",
                          style: app.text.h1)
                    ],
                  ),
                  SizedBox(height: app.space.y2),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: const LineChartCustom(isShowingMainData: true)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(CupertinoIcons.wind),
                          SizedBox(height: app.space.y4),
                          Text(
                            "${state.data!.wind!.speed.toString()} m/s",
                            style: app.text.t1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(CupertinoIcons.drop),
                          SizedBox(height: app.space.y4),
                          Text(
                            "${state.data!.main!.humidity} %",
                            style: app.text.t1,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(CupertinoIcons.snow),
                          SizedBox(height: app.space.y4),
                          Text(
                            "${WeatherUtils.kelvinToCelcius(state.data!.main!.tempMin!).toString()}° C",
                            style: app.text.t1,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("Some error occured"),
          );
        }
      }),
    );
  }
}
