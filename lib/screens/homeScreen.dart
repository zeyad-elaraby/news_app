
import 'package:flutter/material.dart';

import '../apis/api_manager.dart';
import '../tab_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/backGround.png"))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text(
              "NewsApp",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            iconTheme: IconThemeData(color: Colors.white),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
          drawer: Drawer(),
          body: Column(
            children: [
              TabBarWidget(),
                FutureBuilder(
                  future: ApiManager.getNewsData("abc-news-au"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("something went wrong");
                    }
                    var articles = snapshot.data?.articles ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(articles[index].title ?? "");
                        },
                       itemCount:  articles.length,
                      ),
                    );
                  },
                )
            ],
          )),
    );
  }
}
