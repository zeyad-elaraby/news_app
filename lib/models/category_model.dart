import 'dart:ui';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel({required this.id,required this.name,required this.image,required this.color});

 static List<CategoryModel>getCategories(){
    return [
     CategoryModel(id: "business", name: "Business", image: "assets/images/bussines.png", color: Color(0xFFCF7E48)),
     CategoryModel(id: "sports", name: "Sports", image: "assets/images/sports.png", color: Color(0xFFC91C22)),
     CategoryModel(id: "entertainment", name: "Entertainment", image: "assets/images/entertainment.png", color: Color(0xFF003E90)),
     CategoryModel(id: "general", name: "General", image: "assets/images/general.png", color: Color(0xFF4882CF)),
     CategoryModel(id: "health", name: "Health", image: "assets/images/health.png", color: Color(0xFFCED1E79)),
     CategoryModel(id: "science", name: "Science", image: "assets/images/science.png", color: Color(0xFFF2D352)),

    ];

  }
}