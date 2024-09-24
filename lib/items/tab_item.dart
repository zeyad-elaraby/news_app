import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
   TabItem({required this.source,required this.isSelected,super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(8),
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color:Colors.green  ),
      color: isSelected?Colors.green:Colors.transparent
          ),
          child: Text(source.name??"",style: TextStyle(color: isSelected?Colors.white:Colors.green),)),
    );
  }
}
