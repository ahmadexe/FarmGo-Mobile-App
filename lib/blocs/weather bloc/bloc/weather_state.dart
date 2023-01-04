// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  final WeatherResponse? data;
  final String? message;

  const WeatherState({
    this.data,
    this.message,
  });

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherResponseLoading extends WeatherState {
  const WeatherResponseLoading();
}

class WeatherResponseSuccess extends WeatherState {
  const WeatherResponseSuccess({WeatherResponse? data}) : super(data: data);
}

class WeatherResponseFailed extends WeatherState {
  const WeatherResponseFailed({String? message}) : super(message: message);
}
