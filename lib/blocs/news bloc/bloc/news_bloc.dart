import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/news%20bloc/bloc/repository.dart';
import 'package:farmgo/models/article.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNews>(_fetchNews);
  }
  final NewsRepository repo = NewsRepository();
  _fetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(const NewsFetchLoading());
    try {
      List<Article> news = await repo.getArticles();
      emit(NewsFetchSuccess(data: news));
    } catch (e) {
      emit(NewsFetchError(message: e.toString()));
    }
  }
}
