import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/create_build_bloc.dart';
import 'package:social_wakfu/View/CreateBuild.dart';

class CreateBuild_SelectEleResP extends StatelessWidget {
  List<Map<String, dynamic>> elements = [
    {"name": "Fire", "id": 1},
    {"name": "Water", "id": 2},
    {"name": "Air", "id": 3},
    {"name": "Earth", "id": 4},
  ];

  double padding_text = 15;
  double padding_icon = 15;
  CreateBuildBloc bloc;

  @override
  Widget build(BuildContext context) {
    
    bloc = BlocProvider.of<CreateBuildBloc>(context);
    
    return Container(
        color: Colors.grey[300],
        child: Container(
          margin: EdgeInsets.only(top: 4),
          child: Column(
            children: <Widget>[
              elementalPriorityLayout(),
              //Divider(),
              resistancePriorityLayout(),
            ],
          ),
        ));
  }

  Widget elementalPriorityLayout() {
    return Container(
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(180 / 360),
            child: Container(
                width: 370,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                ),
                child: Padding(padding: EdgeInsets.only(top: 10))),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/view_items.png"),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("Elemental Priority",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector( //remove o Ele1P
                          onTap: () {
                            bloc.removeEle(1);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding_text,
                                    top: 5,
                                    right: padding_text),
                                child: SizedBox(
                                  height: 10,
                                  child: StreamBuilder(
                                    stream: bloc.ele1p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.ele1p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector( //seta como fogo
                          onTap: () {
                            bloc.setEleP(1);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(1),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 10),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(1),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector( //remove o ele2P
                          onTap: () {
                            bloc.removeEle(2);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding_text,
                                    top: 5,
                                    right: padding_text),
                                child: SizedBox(
                                  height: 10,
                                  child: StreamBuilder(
                                    stream: bloc.ele2p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.ele2p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector( //seta o como Agua
                          onTap: () {
                            bloc.setEleP(2);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(2),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(2),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector( //remove o Ele3p
                          onTap: () {
                            bloc.removeEle(3);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: StreamBuilder(
                                    stream: bloc.ele3p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.ele3p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector( //seta como terra
                          onTap: () {
                            bloc.setEleP(3);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(3),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(3),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector( //remove o ele4p
                          onTap: () {
                            bloc.removeEle(4);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: StreamBuilder(
                                    stream: bloc.ele2p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.ele4p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector( //seta como ar
                          onTap: () {
                            bloc.setEleP(4);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(4),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(4),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10)
            )
          ),
        ],
      ),
    );
  }

  Widget resistancePriorityLayout() {
    return Container(
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(180 / 360),
            child: Container(
                width: 370,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                ),
                child: Padding(padding: EdgeInsets.only(top: 10))),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/view_items.png"),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("Resistence Priority",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            bloc.removeRes(1);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding_text,
                                    top: 5,
                                    right: padding_text),
                                child: SizedBox(
                                  height: 10,
                                  child: StreamBuilder(
                                    stream: bloc.res1p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.res1p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bloc.setResP(1);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(1),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 10),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(1),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            bloc.removeRes(2);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding_text,
                                    top: 5,
                                    right: padding_text),
                                child: SizedBox(
                                  height: 10,
                                  child: StreamBuilder(
                                    stream: bloc.res2p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.res2p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bloc.setResP(2);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(2),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(2),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            bloc.removeRes(3);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: StreamBuilder(
                                    stream: bloc.res3p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.res3p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bloc.setResP(3);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(3),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(3),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            bloc.removeRes(4);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: StreamBuilder(
                                    stream: bloc.res4p,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Text(
                                          _getTextElement(snapshot.data),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }else{
                                        return Text(
                                          _getTextElement(0),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu"
                                          )
                                        );
                                      }
                                    },
                                  ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: bloc.res4p,
                                      builder: (context, snapshot){
                                        if(snapshot.hasData){
                                          return _getIcon(snapshot.data);
                                        }else{
                                          return _getIcon(0);
                                        }
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bloc.setResP(4);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_text,
                                      top: 5,
                                      right: padding_text),
                                  child: SizedBox(
                                    height: 10,
                                    child: Text(_getTextElement(4),
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Wakfu")),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: padding_icon,
                                      right: padding_icon,
                                      top: 5),
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: _getIcon(4),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: 370,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
              ),
              child: Padding(padding: EdgeInsets.only(top: 10))),
        ],
      ),
    );
  }

  _getIcon(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.add, color: Colors.white);
      case 1:
        return Image.asset("images/fire.png");
      case 2:
        return Image.asset("images/water.png");
      case 3:
        return Image.asset("images/earth.png");
      case 4:
        return Image.asset("images/air.png");
      default:
        return Icon(Icons.add, color: Colors.white);
    }
  }

  _getTextElement(int index) {
    switch (index) {
      case 0:
        return "Empty";
      case 1:
        return "Fire";
      case 2:
        return "Water";
      case 3:
        return "Earth";
      case 4:
        return "Air";
      default:
        return "Empty";
    }
  }
}
