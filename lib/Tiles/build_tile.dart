import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/build_bloc.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/View/ViewBuild.dart';
import 'package:flutter/services.dart';

class BuildTile extends StatelessWidget {
  
  final Build mBuild;
  final BuildBloc buildBloc;
  final ItemBloc itemBloc;

  BuildTile(this.mBuild, this.buildBloc, this.itemBloc);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(bloc: ViewBuildBloc(mBuild),child: ViewBuild(itemBloc, buildBloc))
        )).then((value){
          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        child: Column(
          children: <Widget>[
            Container(
              width: 370,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/${mBuild.classe}.png'), 
                  fit: BoxFit.fill
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(133, 13, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(mBuild.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Wakfu",
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold)
                    )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(135, 1, 50, 6),
                    alignment: Alignment.topLeft,
                    child: Text("Nv.${mBuild.nivel}", style: TextStyle(color: Colors.orange[800]))
                  ),
                ],
              ),
            ),
            Container(
              width: 370,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/end_bg.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(padding: EdgeInsets.only(top: 6))
            )
          ],
        ),
      ),
    );
  }
}