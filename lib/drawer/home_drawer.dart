import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideMenuClick;
   HomeDrawer({required this.onSideMenuClick,super.key});
static const int categories=1;
static const int settings=2;

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical:  MediaQuery.of(context).size.height*0.10,
          ),
          color: Colors.green,
          width: double.infinity,
          // height: MediaQuery.of(context).size.height*0.17,
          child: Text("News App!",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                onSideMenuClick(
                  categories
                );
              },
              child: Row(
                children: [
                  Icon(Icons.list,),
                      SizedBox(width: 3,),
                  Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),

          child: InkWell(
            onTap: () {
              onSideMenuClick(
                settings
              );

            },
            child: Row(
                children: [
                  Icon(Icons.settings),
            SizedBox(width: 3,),
                  Text("Settings",style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
          ),
        )
      ],
    );
  }
}
