import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  
  Function response;
  String title;

  ButtonTile(this.response, this.title);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        this.response();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(4, 4, 4, 2),
        child: Column(
          children: <Widget>[
            RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 360),
              child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10))),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/view_items.png"),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(title, style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10)
              )
            )
          ],
        ),
      ),
    );
  }
}