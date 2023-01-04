import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/weather%20bloc/bloc/repository.dart';

import '../../../models/weather_response.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>(_fetchWeather);
  }

  final WeatherRepository repo = WeatherRepository();

  _fetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherResponseLoading());
    try {
      WeatherResponse response =
          await repo.getWeatherResponse(event.lat, event.long);
      emit(WeatherResponseSuccess(data: response));
    } catch (e) {
      emit(WeatherResponseFailed(message: e.toString()));
    }
  }
}
