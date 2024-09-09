import 'package:flutter/material.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/screens/news_details.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context)=>HomeScreen(),
        NewsDetails.routeName: (context)=>NewsDetails(),
      },

    );

  }

}
