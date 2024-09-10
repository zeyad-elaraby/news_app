import 'package:flutter/material.dart';

import '../apis/api_manager.dart';
import 'news_item.dart';

class SearchTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {

      showResults(context);

    }, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchDate();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text("please enter text to search"),);
    }
    return buildSearchDate();
  }
  Widget buildSearchDate(){
    return FutureBuilder(
      future: ApiManager.getNewsData(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("something went wrong");
        }
        var articles = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(
              article: articles[index],
            );
          },
          itemCount: articles.length,
        );
      },
    );
  }
}
