import 'package:flutter/material.dart';

class AppAppbar {
  static AppBar appBar(String title, BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title:  Text(title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
      centerTitle: true,
      actions: const [
        ImageIcon(
          AssetImage('assets/icons/home.png',),
          color: Colors.white,
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
