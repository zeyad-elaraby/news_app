import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/items/news_item.dart';
import 'package:news_app/items/tab_item.dart';
import 'home_bloc/home_cubit.dart';
import 'home_bloc/home_states.dart';

class TabBarWidget extends StatelessWidget {
  String id;
  TabBarWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => HomeCubit()..getSources(id),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeGetSourceLoadingState ||
                state is HomeGetNewsLoadingState) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is ChangeSourceState) {
              HomeCubit.get(context).getSources(id);
            }
          },
          builder: (context, state) {
            if (state is HomeGetSourceSuccessState ||
                state is HomeGetNewsSuccessState) {
              return Column(
                children: [
                  DefaultTabController(
                      length: HomeCubit.get(context)
                              .sourceResponse
                              ?.sources
                              ?.length ??
                          0,
                      child: TabBar(
                          onTap: (value) {
                            HomeCubit.get(context).changeSource(value);
                          },
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          tabs: HomeCubit.get(context)
                              .sourceResponse!
                              .sources!
                              .map((e) => TabItem(
                                    source: e,
                                    isSelected: HomeCubit.get(context)
                                            .sourceResponse!
                                            .sources!
                                            .elementAt(HomeCubit.get(context)
                                                .selectedSourceIndex) ==
                                        e,
                                  ))
                              .toList())),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsItem(
                          article: HomeCubit.get(context)
                              .newsDataResponse!
                              .articles![index],
                        );
                      },
                      itemCount: HomeCubit.get(context)
                              .newsDataResponse
                              ?.articles
                              ?.length ??
                          0,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [Center(child: Text("something went wrong "))],
              );
            }
          },
        ),
      ),
    );
  }
}

// Column(
//           children: [
//             DefaultTabController(
//                 length: sources.length,
//                 child: TabBar(
//                     onTap: (value) {
//                       selectedTabIndex=value;
//                       setState(() {
//
//                       });
//                     },
//                     indicatorColor: Colors.transparent,
//                     dividerColor: Colors.transparent,
//                     isScrollable: true,
//                     tabs: sources
//                         .map((e) => TabItem(
//                       source: e,
//                       isSelected: sources.elementAt(selectedTabIndex)==e,
//                     ))
//                         .toList())),
//             FutureBuilder(
//               future: ApiManager.getNewsData( sourceId:   sources[selectedTabIndex].id??""),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Text("something_went_wrong");
//                 }
//                 var articles = snapshot.data!.articles ?? [];
//                 return Expanded(
//                   child: ListView.builder(
//                     itemBuilder: (context, index) {
//                       return NewsItem(article:articles[index] ,);
//                     },
//                     itemCount:  articles.length,
//                   ),
//                 );
//               },
//             )
//
//           ],
//         );
