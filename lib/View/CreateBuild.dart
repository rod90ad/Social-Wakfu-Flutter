import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_wakfu/Bloc/create_build_bloc.dart';
import 'package:social_wakfu/View/CreateBuild/CreateBuild_SelectClass.dart';
import 'package:social_wakfu/View/CreateBuild/CreateBuild_SelectEleResP.dart';
import 'package:social_wakfu/View/CreateBuild/CreateBuild_SetName.dart';

class CreateBuildPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: theme.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.accentColor, // Change your color here
          ),
          title: Text("Create Build",
            style: TextStyle(color: theme.accentColor),
          ),
          centerTitle: true,
        ),
        body: getBody(context)
      )
    );
  }

  Widget getBody(BuildContext context){
    ThemeData theme = Theme.of(context);
    CreateBuildBloc bloc = BlocProvider.of<CreateBuildBloc>(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, //AssetImage("images/${snapshot.data}.png");
      children: <Widget>[
        Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.head,
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
                      stream: bloc.buildName,
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
                      stream: bloc.buildLevel,
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
                              stream: bloc.ele1p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.ele2p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.ele3p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.ele4p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.res1p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.res2p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.res3p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
                              stream: bloc.res4p,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return requestElement(snapshot.data);
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
            Container(
              width: 370,
              margin: EdgeInsets.fromLTRB(0, 125, 0, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/end_bg.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(padding: EdgeInsets.only(top: 10))
            ),
          ],
        ),
        _midTabLayout(context)
      ],
    );
  }

  _midTabLayout(BuildContext context){
    ThemeData theme = Theme.of(context);
    
    return Container(
      height: 377,
      width: 370,
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [CreateBuild_SelectClass(),CreateBuild_SelectEleResP(),CreateBuild_SetName()]
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(text: "Class"),
                Tab(text: "Elements"),
                Tab(text: "Name"),
              ],
              indicatorColor: theme.primaryColor,
              unselectedLabelColor: Colors.grey,
              labelColor: theme.primaryColor,
            ),
          ),
        ),
      )
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
  
  Future<bool> _requestPop() {
    return Future.value(true);
  }
}
