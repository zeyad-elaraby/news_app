import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/search_bloc/search_cubit.dart';
import 'package:news_app/search_bloc/search_states.dart';

import '../items/news_item.dart';

class SearchTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchDate();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backGround.png"),
                  fit: BoxFit.fill)),
          child: Center(child: Text("please_enter_text_to_search".tr())));
    }
    return buildSearchDate();
  }

  @override
  appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),

          ),
          foregroundColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(hintStyle: TextStyle(color: Colors.white),)
    );
  }

  Widget buildSearchDate() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backGround.png"),
              fit: BoxFit.fill)),
      child: LoaderOverlay(
        child: BlocProvider(
          create: (context) => SearchCubit()..getNewsData(query: query),
          child: BlocConsumer<SearchCubit, SearchStates>(
            listener: (context, state) {
              if (state is SearchLoadingState) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
            },
            builder: (context, state) {
              if (state is SearchSuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(
                      article: SearchCubit.get(context)
                          .newsDataResponse!
                          .articles![index],
                    );
                  },
                  itemCount: SearchCubit.get(context)
                          .newsDataResponse
                          ?.articles
                          ?.length ??
                      0,
                );
              } else {
                return Column(
                  children: [
                    Center(child: Text("")),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
