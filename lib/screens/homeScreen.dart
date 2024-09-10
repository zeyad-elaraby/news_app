import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/search_tab.dart';
import 'package:news_app/screens/settings_screen.dart';

import '../apis/api_manager.dart';
import '../drawer/home_drawer.dart';
import '../tab_bar_widget.dart';
import 'categories_tab.dart';

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
            selectedSideMenuItem==HomeDrawer.settings?"Settings":selectedCategory==null?"News App!":selectedCategory!.name,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
              IconButton(onPressed: () {
                showSearch(context: context, delegate: SearchTab());
              }, icon: Icon(Icons.search)),
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuClick: onSideMenuItemClick,),
        ),
        body:
        selectedSideMenuItem==HomeDrawer.settings?SettingsScreen():
        selectedCategory==null?CategoriesTab(
          onClick: onCategorySelect,
        ):TabBarWidget(id: selectedCategory!.id,),
      ),
    );
  }

  CategoryModel? selectedCategory = null;
  onCategorySelect(cat) {
    selectedCategory = cat;
    setState(() {});
  }
int selectedSideMenuItem=HomeDrawer.categories;
  onSideMenuItemClick(int newSideMenuItem){
    selectedSideMenuItem=newSideMenuItem;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
