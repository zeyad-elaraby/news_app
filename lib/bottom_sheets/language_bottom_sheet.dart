import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.blue,);

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: InkWell(
              onTap: () {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("English",
                      style: context.locale == Locale("en")
                          ? TextStyle(color: Colors.green,fontSize: 15)
                          : TextStyle(color: Colors.black,fontSize: 15)),
                  context.locale == Locale("en")
                      ? Icon(
                          Icons.done,
                          size: 20,
                          color: Colors.green,
                        )
                      : SizedBox(),

                  // Icon(Icons.done),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: InkWell(
              onTap: () {
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("العربيه",
                      style: context.locale == Locale("ar")
                          ? TextStyle(color: Colors.green,fontSize: 15)
                          : TextStyle(color: Colors.black,fontSize: 15)),
                  context.locale == Locale("ar")
                      ? Icon(
                          Icons.done,
                          size: 20,
                          color: Colors.green,
                        )
                      : SizedBox(),
                  // Icon(Icons.done),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
