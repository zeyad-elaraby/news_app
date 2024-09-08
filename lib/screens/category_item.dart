import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.isOdd,required this.model,super.key});
CategoryModel model;
bool isOdd;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color:model.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight:isOdd? Radius.circular(25):Radius.zero,
          bottomLeft:!isOdd? Radius.circular(25):Radius.zero,
        )

      ),
      child: Column(
        children: [
          SizedBox(
              height: 120,
              width: 100,
              child: Image(image: AssetImage(model.image))),
          Text(model.name,style: TextStyle(fontSize: 18,color: Colors.white),)
        ],
      ),
    );
  }
}
