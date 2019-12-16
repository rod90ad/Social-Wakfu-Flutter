import 'package:flutter/material.dart';

class BattleMainTile extends StatelessWidget {
  
  String imgIdx;
  Stream<int> stream;
  String title;
  String sulfix;

  BattleMainTile(this.imgIdx, this.stream, this.title, this.sulfix);
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: width/2-6,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/battle_bg.png"),
                  fit: BoxFit.fill
                )
              ),
            ),
            Container(
              width: 29,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/btl_main_$imgIdx.png"),
                  fit: BoxFit.fitHeight
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(title, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff51636b))),
            ),
            Container(
              margin: EdgeInsets.only(left: width/2-30),
              child: StreamBuilder(
                stream: stream,
                builder: (context, snapshot){
                  return Text("${snapshot.data}$sulfix", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff60ae60)),);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}