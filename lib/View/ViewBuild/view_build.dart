import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Bloc/select_Item_bloc.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';
import 'package:social_wakfu/Tiles/ViewBuild/title_bar_tile.dart';
import 'package:social_wakfu/Tiles/ViewBuild/view_build_battle_main_tile.dart';
import 'package:social_wakfu/Tiles/ViewBuild/view_build_battle_secondary_tile.dart';
import 'package:social_wakfu/Tiles/ViewBuild/view_build_buttons_tile.dart';
import 'package:social_wakfu/Tiles/ViewBuild/view_build_especial_stats_tile.dart';
import 'package:social_wakfu/Tiles/ViewBuild/view_build_item_tile.dart';
import 'package:social_wakfu/Tiles/ViewBuild/view_build_mastery_tile.dart';
import 'package:social_wakfu/View/ViewBuild/select_item_dialog.dart';

class FragViewBuild extends StatelessWidget {

  final ItemBloc itemBloc;
  final ViewBuildBloc buildBloc;
  final Size size;

  FragViewBuild(this.itemBloc, this.buildBloc, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getBar(),
            getBackgroud(getItemsLayout()),
            getBackgroud(getEspecialStatsLayout()),
            getBackgroud(TitleBarTile("Mastery")),
            getBackgroud(getMastery()),
            getBackgroud(TitleBarTile("Battle")),
            getBackgroud(getBattleMain()),
            getBackgroud(TitleBarTile("Secondary")),
            getBackgroud(getBattleSecondary()),
            getBackgroud(getActionButtons()),
            getEndBackground()
          ],
        ),
      )
    );
  }

  Widget getBackgroud(Widget innerContent){
    return Container(
      width: 370,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/view_items.png"),fit: BoxFit.fill),
      ),
      child: innerContent,
    );
  }

  Widget getItemsLayout(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: GridView.builder(
        itemCount: 14,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
        itemBuilder: (context, index){
          return InkWell(
            child:ViewBuildItemTile(index, buildBloc, itemBloc),
            onTap: (){
              print("tocou o idx $index");
              _showOptions(context, index);
            },
          );
        },
      ),
    );
  }

  Widget getBar(){
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        StreamBuilder(
          stream: buildBloc.buildHead,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Container(
                width: 370,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/${snapshot.data}.png'), 
                    fit: BoxFit.fill
                  ),
                )
              );
            }else{
              return Container(
                width: 370,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/0.png'), 
                    fit: BoxFit.fill
                  ),
                )
              );
            }
          },
        ),
        Container(
          width: 370,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(133, 13, 0, 0),
                alignment: Alignment.topLeft,
                child: StreamBuilder<String>(
                  stream: buildBloc.buildName,
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Text(snapshot.data,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Wakfu",
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)
                      );
                    }else{
                      return Text("Choose a build Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Wakfu",
                          fontWeight: FontWeight.bold)
                      );
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(135, 1, 50, 6),
                alignment: Alignment.topLeft,
                child: StreamBuilder<int>(
                  stream: buildBloc.buildLevel,
                  builder: (context, snap){
                    if(snap.hasData){
                      return Text("Nv.${snap.data}",
                        style: TextStyle(color: Colors.orange[800])
                      );
                    }else{
                      return Text("Nv.200",
                        style: TextStyle(color: Colors.orange[800])
                      );
                    }
                  },
                ),
              )
            ],
          )
        ),
        Container(
          width: 370,
          margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/view_items.png"),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Elemental Priority:", textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildElep,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[0]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildElep,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[1]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildElep,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[2]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildElep,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[3]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Resistence Priority:", textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildResp,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[0]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildResp,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[1]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildResp,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[2]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: StreamBuilder(
                          stream: buildBloc.buildResp,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return requestElement(int.parse(snapshot.data.split("-")[3]));
                            }else{
                              return requestElement(0);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getEspecialStatsLayout(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ViewBuildEspecialStatsTile(buildBloc, 0),
        ViewBuildEspecialStatsTile(buildBloc, 1),
        ViewBuildEspecialStatsTile(buildBloc, 2),
        ViewBuildEspecialStatsTile(buildBloc, 3),
      ],
    );
  }

  Widget getMastery(){
    return MasteryTile(buildBloc);
  }

  Widget getBattleMain(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              BattleMainTile("01", buildBloc.buildFinalDmg, "Damage inflicted", "%"),
              BattleMainTile("02", buildBloc.buildHealPerformed, "Heals Performed", "%"),
            ],
          ),
          Row(
            children: <Widget>[
              BattleMainTile("03", buildBloc.buildCriticalHits, "Critical Hits", "%"),
              BattleMainTile("04", buildBloc.buildBlock, "Block", "%"),
            ],
          ),
          Row(
            children: <Widget>[
              BattleMainTile("05", buildBloc.buildInitiative, "Initiative", ""),
              BattleMainTile("06", buildBloc.buildRange, "Range", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleMainTile("07", buildBloc.buildDodge, "Dodge", ""),
              BattleMainTile("08", buildBloc.buildLock, "Lock", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleMainTile("09", buildBloc.buildWisdom, "Wisdom", ""),
              BattleMainTile("10", buildBloc.buildProspecting, "Prospecting", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleMainTile("11", buildBloc.buildControl, "Control", ""),
              BattleMainTile("12", buildBloc.buildKitSkill, "Kit Skill", ""),
            ],
          ),
        ],
      ),
    );
  }

  Widget getBattleSecondary(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              BattleSecondaryTile("01", buildBloc.buildCriticalMastery, "Critical Mastery", ""),
              BattleSecondaryTile("02", buildBloc.buildCriticalResistance, "Critical Resistance", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleSecondaryTile("03", buildBloc.buildRearMastery, "Rear Mastery", ""),
              BattleSecondaryTile("04", buildBloc.buildRearResistance, "Rear Resistance", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleSecondaryTile("05", buildBloc.buildMeleeMastery, "Melee Mastery", ""),
              BattleSecondaryTile("06", buildBloc.buildDistanceMastery, "Distance Resistance", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleSecondaryTile("07", buildBloc.buildSingleTargetMastery, "Single Target Mastery", ""),
              BattleSecondaryTile("08", buildBloc.buildAreaMastery, "Area Resistance", ""),
            ],
          ),
          Row(
            children: <Widget>[
              BattleSecondaryTile("09", buildBloc.buildHealingMastery, "Healing Mastery", ""),
              BattleSecondaryTile("10", buildBloc.buildBerserkMastery, "Berserk Mastery", ""),
            ],
          ),
        ]
      )
    );
  }

  Widget getActionButtons(){
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,        
        children: <Widget>[          
          ButtonTile(buildBloc.publishBuild, "Publish"),
          ButtonTile(buildBloc.deleteBuild, "Delete"),
          ButtonTile(buildBloc.shareBuild, "Share"),
        ],
      ),
    );
  }

  Widget getEndBackground(){
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/end_bg.png"),
            fit: BoxFit.fill),
      ),
      child: Padding(padding: EdgeInsets.only(top: 10))
    );
  }

  requestElement(int index){
    switch(index){
      case 0: return Icon(Icons.add, color: Colors.white);
      case 1: return Image.asset("images/fire.png", scale: 1.0);
      case 2: return Image.asset("images/water.png", scale: 1.0);
      case 3: return Image.asset("images/earth.png", scale: 1.0);
      case 4: return Image.asset("images/air.png", scale: 1.0);
      default: return Icon(Icons.add, color: Colors.white);
    }
  }

  Future _showOptions(BuildContext context, int index) async{
    int itemId = await Navigator.of(context).push(MaterialPageRoute<int>(
      builder: (BuildContext context) => BlocProvider(bloc: SelectItemBloc(index, itemBloc, buildBloc), child: SelectItemDialog(size,  buildBloc.getItemIdByIndex(index))),
      fullscreenDialog: true
    ));
    if(itemId!=null){
      print(itemId);
      buildBloc.updateItem(itemId, index);
    }
  }
}