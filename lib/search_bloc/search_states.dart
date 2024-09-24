import 'package:news_app/models/NewsData.dart';

abstract class SearchStates {}

class SearchInitState extends SearchStates{}
class SearchSuccessState extends SearchStates{
  NewsDataResponse newsDataResponse;
  SearchSuccessState(this.newsDataResponse);
}
class SearchLoadingState extends SearchStates{}
class SearchErrorState extends SearchStates{
  String error;
 SearchErrorState(this.error);
}