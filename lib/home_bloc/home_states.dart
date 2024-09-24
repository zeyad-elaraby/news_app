import 'package:news_app/models/NewsData.dart';
import 'package:news_app/models/SourceResponse.dart';

abstract class HomeState{

}
class HomeInitState extends HomeState {}
class HomeGetSourceLoadingState extends HomeState {}
class HomeGetSourceErrorState extends HomeState {
  String error;
  HomeGetSourceErrorState(this.error);
}
class HomeGetSourceSuccessState extends HomeState {
  SourceResponse sourceResponse;
  HomeGetSourceSuccessState(this.sourceResponse);
}


class HomeGetNewsLoadingState extends HomeState {}
class HomeGetNewsErrorState extends HomeState {
  String error;
  HomeGetNewsErrorState(this.error);
}
class HomeGetNewsSuccessState extends HomeState {
  NewsDataResponse newsDataResponse;
  HomeGetNewsSuccessState(this.newsDataResponse);

}
class ChangeSourceState extends HomeState{
}


