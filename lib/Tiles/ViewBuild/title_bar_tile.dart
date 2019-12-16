import 'package:flutter/material.dart';

class TitleBarTile extends StatelessWidget {
  
  String title;

  TitleBarTile(this.title);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      margin: EdgeInsets.only(left: 6, right: 6, top: 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/title_bar.png")
        )
      ),
      child: Text("$title", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Wakfu")),    
    );
  }
}