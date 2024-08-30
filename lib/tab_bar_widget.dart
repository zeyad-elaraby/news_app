import 'package:flutter/material.dart';
import 'package:news_app/tab_item.dart';

import 'apis/api_manager.dart';

class TabBarWidget extends StatefulWidget {
   TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarWidget> {
  int selectedTabIndex=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("something went wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
            length: sources.length,
            child: TabBar(
                onTap: (value) {
                  selectedTabIndex=value;
                  setState(() {

                  });
                },
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabs: sources
                    .map((e) => TabItem(
                  source: e,
                  isSelected: sources.elementAt(selectedTabIndex)==e,
                ))
                    .toList()));
      },
    );
  }
}
