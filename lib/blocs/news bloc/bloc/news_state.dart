// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  final List<Article>? data;
  final String? message;
  const NewsState({
    this.data,
    this.message,
  });

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsFetchLoading extends NewsState {
  const NewsFetchLoading() : super();
}

class NewsFetchSuccess extends NewsState {
  const NewsFetchSuccess({List<Article>? data}) : super(data: data);
}

class NewsFetchError extends NewsState {
  const NewsFetchError({String? message}) : super(message: message);
}
