import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/home_bloc/home_states.dart';

import '../api_key.dart';
import '../models/NewsData.dart';
import '../models/SourceResponse.dart';


class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitState());
SourceResponse? sourceResponse;
NewsDataResponse? newsDataResponse;
int selectedSourceIndex=0;
static HomeCubit get(context)=>BlocProvider.of(context);
changeSource(int index){
  selectedSourceIndex=index;
  emit(ChangeSourceState());
}
 Future<void> getSources(String id )async{
    emit(HomeGetSourceLoadingState());
    try{
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": apiKey, "category": id});
      http.Response response = await http.get(url);

      Map<String, dynamic> jsonFormat = jsonDecode(response.body);
      SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
      if(response.statusCode!=200){
        emit(HomeGetSourceErrorState(sourceResponse.message??""));
        return;
      }
      this.sourceResponse=sourceResponse;
      getNewsData( sourceId:   sourceResponse.sources![selectedSourceIndex].id!);
      emit(HomeGetSourceSuccessState(sourceResponse));

    }catch(e){
      emit(HomeGetSourceErrorState("something went wrong"));

    }

  }

  Future<void> getNewsData({String? sourceId, String? query})async{
 try{
   emit(HomeGetNewsLoadingState());
   //https://newsapi.org/v2/everything?q=bitcoin&apiKey=ee069b6be5da48eba8c4ad85f00c9469
   Uri url = Uri.https(
     "newsapi.org",
     "/v2/everything",
     {
       "apiKey": apiKey,
       "sources": sourceId,
       "q": query
     },
   );
   http.Response response = await http.get(url);
   var jsonFormat = jsonDecode(response.body);
   NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
   if(response.statusCode!=200){
     emit(HomeGetNewsErrorState(newsDataResponse.message??""));
     return;

   }
   this.newsDataResponse=newsDataResponse;
   emit(HomeGetNewsSuccessState(newsDataResponse));

 }catch(e){
   emit(HomeGetNewsErrorState("something went wrong"));

 }
}

}