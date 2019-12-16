import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';

class MasteryTile extends StatelessWidget {
  
  ViewBuildBloc buildBloc;

  MasteryTile(this.buildBloc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getWater(),
            getEarth(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getAir(),
            getFire(),
          ],
        ),
      ],
    );
  }

  Widget getWater(){
    return Row(
      children: <Widget>[
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/water_dmg.png")
            )
          ),
        ),
        Container(
          width: 28,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_icon.png")
            )
          ),
        ),
        Container(
          width: 60,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildWaterDmg,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 22,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/res_icon.png")
            )
          ),
        ),
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildWaterRes,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 6,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg_end.png"),
              fit: BoxFit.fitHeight
            )
          ),
        ),
      ],
    );
  }

  Widget getEarth(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/earth_dmg.png")
            )
          ),
        ),
        Container(
          width: 28,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_icon.png")
            )
          ),
        ),
        Container(
          width: 60,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildEarthDmg,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 22,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/res_icon.png")
            )
          ),
        ),
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildEarthRes,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 6,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg_end.png"),
              fit: BoxFit.fitHeight
            )
          ),
        ),
      ],
    );
  }

  Widget getAir(){
    return Row(
      children: <Widget>[
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/air_dmg.png")
            )
          ),
        ),
        Container(
          width: 28,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_icon.png")
            )
          ),
        ),
        Container(
          width: 60,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildAirDmg,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 22,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/res_icon.png")
            )
          ),
        ),
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildAirRes,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 6,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg_end.png"),
              fit: BoxFit.fitHeight
            )
          ),
        ),
      ],
    );
  }

  Widget getFire(){
    return Row(
      children: <Widget>[
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fire_dmg.png")
            )
          ),
        ),
        Container(
          width: 28,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_icon.png")
            )
          ),
        ),
        Container(
          width: 60,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildFireDmg,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 22,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/res_icon.png")
            )
          ),
        ),
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg.png"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 5),
            child: StreamBuilder(
              stream: buildBloc.buildFireRes,
              builder: (context, snapshot){
                return Text("${snapshot.data}", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold));
              },
            )
          )
        ),
        Container(
          width: 6,
          height: 29,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dmg_bg_end.png"),
              fit: BoxFit.fitHeight
            )
          ),
        ),
      ],
    );
  }
}