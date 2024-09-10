import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel({required this.id,required this.name,required this.image,required this.color});

 static List<CategoryModel>getCategories(){
    return [
     CategoryModel(id: "business", name: "business".tr(), image: "assets/images/bussines.png", color: Color(0xFFCF7E48)),
     CategoryModel(id: "sports", name: "sports".tr(), image: "assets/images/sports.png", color: Color(0xFFC91C22)),
     CategoryModel(id: "entertainment", name: "entertainment".tr(), image: "assets/images/entertainment.png", color: Color(0xFF003E90)),
     CategoryModel(id: "general", name: "general".tr(), image: "assets/images/general.png", color: Color(0xFF4882CF)),
     CategoryModel(id: "health", name: "health".tr(), image: "assets/images/health.png", color: Color(0xFFCED1E79)),
     CategoryModel(id: "science", name: "science".tr(), image: "assets/images/science.png", color: Color(0xFFF2D352)),

    ];

  }
}