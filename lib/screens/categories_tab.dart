import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bottom_sheets/language_bottom_sheet.dart';
import 'package:news_app/models/category_model.dart';

import 'category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;
  CategoriesTab({required this.onClick,super.key});
  List<CategoryModel> categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text("pick_your_category_of_interest".tr(),style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.w700),),
          SizedBox(height: 18,),
          Expanded(
            child: GridView.builder(

                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12
                    ),
      
      
              itemBuilder: (BuildContext context, int index) {
                 return InkWell(
                     onTap: () {
                       onClick(categories[index]);

                     },
                     child: CategoryItem(model: categories[index],isOdd: index.isOdd,));
      
              },
      
            itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
