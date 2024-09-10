import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/bottom_sheets/language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/backGround.png"))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("language".tr(),style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w700),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(shape: BoxShape.rectangle,border: Border.all(color: Colors.green)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      context.locale == Locale("en")?Text("English".tr(),style: TextStyle(color: Colors.green))
                        :Text("العربيه",style: TextStyle(color: Colors.green)
                        ,),
                      Spacer(),
                      IconButton(onPressed: () {
                          showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return LanguageBottomSheet();
                            },
                          );
                      },color: Colors.green, icon: Icon(Icons.arrow_drop_down),)
                    ],
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
