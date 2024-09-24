import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/search_bloc/search_states.dart';
import 'package:http/http.dart' as http;

import '../api_key.dart';
import '../models/NewsData.dart';


class SearchCubit extends Cubit<SearchStates>{
  NewsDataResponse? newsDataResponse;

  SearchCubit(): super(SearchInitState());
  static SearchCubit  get(context)=>BlocProvider.of<SearchCubit>(context);

  Future<void> getNewsData({String? sourceId, String? query})async{
    try{
      emit(SearchLoadingState());
      //https://newsapi.org/v2/everything?q=bitcoin&apiKey=ee069b6be5da48eba8c4ad85f00c9469
      Uri url = Uri.https(
        "newsapi.org",
        "/v2/everything",
        {
          "apiKey": apiKey,///      <= your api key here
          "sources": sourceId,
          "q": query
        },
      );
      http.Response response = await http.get(url);
      var jsonFormat = jsonDecode(response.body);
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
      if(response.statusCode!=200){
        emit(SearchErrorState(newsDataResponse.message??""));
        return;

      }
      this.newsDataResponse=newsDataResponse;
      emit(SearchSuccessState(newsDataResponse));

    }catch(e){
      emit(SearchErrorState("something went wrong"));

    }
  }

}